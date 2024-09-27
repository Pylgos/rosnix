{
  lib,
  stdenv,
  buildPackages,
  rosSetupHook,
  mkShell,
}:
let
  mkOverlayBuilder =
    builderFn: overlay: arg:
    let
      argAttrs = (lib.toFunction arg) finalAttrs;
      finalAttrs = argAttrs // (overlay final finalAttrs argAttrs);
      final = (builderFn finalAttrs) // {
        inherit overrideAttrs;
      };
      overrideAttrs =
        f:
        let
          newOverlay =
            final: finalAttrs: prev:
            let
              firstAttrs = overlay final finalAttrs prev;
              secondAttrs = firstAttrs // (lib.toFunction f) firstAttrs;
            in
            secondAttrs;
        in
        mkOverlayBuilder builderFn newOverlay arg;
    in
    final;
in
mkOverlayBuilder stdenv.mkDerivation (
  finalDrv: finalAttrs:
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
      buildPackages.pythonForRosPackages.colcon-common-extensions
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
      shell = mkShell {
        name = "${finalAttrs.pname or "ros"}-workspace";
        nativeBuildInputs = [ rosSetupHook ];
        buildInputs = [ finalDrv ];
        shellHook = ''
          ROSNIX_SETUP_DEVEL_ENV=1 _rosnixSetupHook_postHook 2> /dev/null
        '';
      };
    } // passthru;
  }
)
