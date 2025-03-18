{
  lib,
  stdenv,
  buildPackages,
  rosSetupHook,
  mkRosWorkspaceShell,
  mkRecursiveBuilder,
  concatToPolyfillHook,
}:
mkRecursiveBuilder stdenv.mkDerivation (
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
    passthru ? { },
    ...
  }@args:

  (lib.removeAttrs args [ ])
  // {
    inherit
      strictDeps
      dontUseCmakeConfigure
      dontWrapQtApps
      doCheck
      ;

    nativeBuildInputs =
      nativeBuildInputs
      ++ [
        concatToPolyfillHook
        rosSetupHook
      ]
      ++ (with buildPackages.rosPythonPackages; [
        colcon-core
        colcon-bash
        colcon-zsh
        colcon-library-path
        colcon-metadata
      ]);

    buildPhase =
      if buildPhase == null then
        ''
          runHook preBuild

          local colconFlagsArray=(
            --paths .
            --merge-install
            --install-base "$out"
            --executor sequential
          )
          concatTo colconFlagsArray colconFlags buildFlags buildFlagsArray

          colcon build "''${colconFlagsArray[@]}"

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

          local colconFlagsArray=(
            --merge-install
            --install-base "$out"
          )

          colcon test "''${colconFlagsArray[@]}"

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
      shell = mkRosWorkspaceShell {
        name = "${finalAttrs.pname or "ros"}-workspace-shell";
        buildInputs = [ finalDrv ];
      };
    } // passthru;
  }
)
