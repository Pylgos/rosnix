{
  lib,
  buildColconPackage,
  buildPackages,
}:

# A special kind of derivation that is only meant to be consumed by the
# nix-shell.
{
  name ? "ros-workspace-shell",
  # a list of packages to add to the shell environment
  packages ? [ ],
  # propagate all the inputs from the given derivations
  inputsFrom ? [ ],
  buildInputs ? [ ],
  nativeBuildInputs ? [ ],
  propagatedBuildInputs ? [ ],
  propagatedNativeBuildInputs ? [ ],
  shellHook ? "",
  stdenv ? null,
  ...
}@attrs:
let
  mergeInputs =
    name:
    (attrs.${name} or [ ])
    ++
      # 1. get all `{build,nativeBuild,...}Inputs` from the elements of `inputsFrom`
      # 2. since that is a list of lists, `flatten` that into a regular list
      # 3. filter out of the result everything that's in `inputsFrom` itself
      # this leaves actual dependencies of the derivations in `inputsFrom`, but never the derivations themselves
      (lib.subtractLists inputsFrom (lib.flatten (lib.catAttrs name inputsFrom)));

  rest = builtins.removeAttrs attrs [
    "name"
    "packages"
    "inputsFrom"
    "buildInputs"
    "nativeBuildInputs"
    "propagatedBuildInputs"
    "propagatedNativeBuildInputs"
    "shellHook"
    "stdenv"
  ];

  buildColconPackageWithStdenv = buildColconPackage.override (oldAttrs: {
    stdenv = if stdenv == null then oldAttrs.stdenv else stdenv;
  });
in

buildColconPackageWithStdenv (
  {
    inherit name;

    buildInputs = mergeInputs "buildInputs";
    nativeBuildInputs =
      [
        buildPackages.rosPythonPackages.colcon-common-extensions
      ]
      ++ packages
      ++ (mergeInputs "nativeBuildInputs");
    propagatedBuildInputs = mergeInputs "propagatedBuildInputs";
    propagatedNativeBuildInputs = mergeInputs "propagatedNativeBuildInputs";

    shellHook = lib.concatStringsSep "\n" (
      (lib.catAttrs "shellHook" (lib.reverseList inputsFrom ++ [ attrs ]))
      ++ [
        ''
          if type register-python-argcomplete > /dev/null 2>&1; then
            if type colcon > /dev/null 2>&1; then
              eval "$(register-python-argcomplete colcon)"
            fi
          fi
        ''
        shellHook
      ]
    );

    phases = [ "buildPhase" ];

    buildPhase = ''
      { echo "------------------------------------------------------------";
        echo " WARNING: the existence of this path is not guaranteed.";
        echo " It is an internal implementation detail for pkgs.rosPackages.mkRosWorkspaceShell.";
        echo "------------------------------------------------------------";
        echo;
        # Record all build inputs as runtime dependencies
        export;
      } >> "$out"
    '';

    preferLocalBuild = true;
  }
  // rest
)
