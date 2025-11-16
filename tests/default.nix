{ lib, pkgs }:
let
  inherit (pkgs) rosPackages testers runCommand;
  inherit (lib) splitVersion elemAt match;
  inherit (lib.devshell-apps.mkBuilders pkgs) writeDevshellApplication;

  mkTestScript =
    {
      name,
      text,
      packages,
    }:
    writeDevshellApplication {
      inherit name text;
      shell = rosPackages.mkRosWorkspaceShell {
        buildInputs = packages;
      };
      rcScriptConfigs.runShellHook = false;
    };

  majorMinorPatch =
    s:
    let
      versionElem = elemAt (splitVersion s);
    in
    "${versionElem 0}.${versionElem 1}.${versionElem 2}";

  extractVersion =
    text:
    let
      versionRegex = ".*(([0-9]+)\\.([0-9]+)\\.([0-9]+)).*";
      result = match versionRegex text;
    in
    elemAt result 0;

  testVersion =
    {
      package,
      command ? "${package.meta.mainProgram or package.pname or package.name} --version",
      version ? majorMinorPatch package.version,
    }:
    runCommand "${package.name}-test-version"
      {
        nativeBuildInputs = [
          package
          pkgs.rosPackages.rosSetupHook
        ];
        meta.timeout = 60;
      }
      ''
        if output=$(${command} 2>&1 | sed -e 's|${builtins.storeDir}/[^/ ]*/|{{storeDir}}/|g'); then
          if grep -Fw -- "${version}" - <<< "$output"; then
            touch $out
          else
            echo "Version string '${version}' not found!" >&2
            echo "The output was:" >&2
            echo "$output" >&2
            exit 1
          fi
        else
          echo -n ${lib.escapeShellArg command} >&2
          echo " returned a non-zero exit code." >&2
          echo "$output" >&2
          exit 1
        fi
      '';
in
{
  rviz2-window-test = testers.runNixOSTest {
    name = "rviz2-window-test";
    nodes.machine =
      { pkgs, ... }:
      {
        imports = [ ./nixos/x11.nix ];
        environment.systemPackages = [
          (mkTestScript {
            name = "run-rviz2";
            text = ''
              rviz2
            '';
            packages = [ pkgs.rosPackages.rviz2 ];
          })
        ];
      };
    testScript =
      { ... }:
      ''
        machine.wait_for_x()
        machine.execute("xterm -e 'run-rviz2' >&2 &")
        machine.wait_for_window("RViz")
      '';
  };
}
