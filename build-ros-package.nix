{
  lib,
  stdenv,
  buildPackages,
  rosSetupHook,
  mkShell,
}:
let
  addShellAttr =
    drv:
    drv
    // {
      shell = mkShell {
        name = "${drv.pname or "ros"}-workspace";
        nativeBuildInputs = [ rosSetupHook ];
        buildInputs = [ drv ];
        shellHook = ''
          ROSNIX_SETUP_DEVEL_ENV=1 _rosnixSetupHook_postHook 2> /dev/null
        '';
      };
    };
in
lib.adaptMkDerivation { modify = addShellAttr; } stdenv.mkDerivation (
  finalAttrs:
  {
    nativeBuildInputs ? [ ],
    buildPhase ? null,
    installPhase ? null,
    checkPhase ? null,
    doCheck ? false,
    dontUseCmakeConfigure ? true,
    strictDeps ? true,
    dontWrapQtApps ? true,
    shellHook ? "",
    rosCmakeArgs ? [ ],
    missingDependencies ? [ ],
    passthru ? { },
    cmakeBuildType ? "Release",
    ...
  }@args:

  (lib.removeAttrs args [ "missingDependencies" ])
  // {
    inherit
      cmakeBuildType
      strictDeps
      dontUseCmakeConfigure
      dontWrapQtApps
      doCheck
      rosCmakeArgs
      ;

    nativeBuildInputs = nativeBuildInputs ++ [
      buildPackages.python3Packages.colcon-common-extensions
      rosSetupHook
    ];

    buildPhase =
      if buildPhase == null then
        ''
          runHook preBuild

          MAKEFLAGS="-j$NIX_BUILD_CORES" colcon --log-base ./log build \
            --paths . \
            --merge-install \
            --install-base "$out" \
            --build-base ./build \
            --event-handlers console_cohesion- console_direct+ console_package_list- console_start_end- console_stderr- desktop_notification- event_log- log- log_command- status- store_result- summary- terminal_title- \
            --executor sequential \
            --cmake-args \
              " -DCMAKE_BUILD_TYPE=$cmakeBuildType" \
              " -DBUILD_TESTING=${if finalAttrs.doCheck then "ON" else "OFF"}" ${
                lib.concatStringsSep " " (map (arg: lib.escapeShellArg (" " + arg)) finalAttrs.rosCmakeArgs)
              }

          runHook postBuild
        ''
      else
        buildPhase;

    installPhase =
      if installPhase == null then
        ''
          runHook preInstall
          runHook postInstall
        ''
      else
        installPhase;

    checkPhase =
      if checkPhase == null then
        ''
          runHook preCheck

          colcon test \
            --merge-install \
            --install-base "$out"

          runHook postCheck
        ''
      else
        checkPhase;

    shellHook =
      ''
        ROSNIX_SETUP_DEVEL_ENV=1 _rosnixSetupHook_postHook 2> /dev/null
      ''
      + shellHook;

    passthru = {
      inherit missingDependencies;
    } // passthru;
  }
)
