{
  lib,
  stdenv,
  buildColconPackage,
  buildPackages,
  mkRecursiveBuilder,
}:
let
  inherit (lib)
    findFirst
    isString
    optional
    optionals
    ;

  # Copied from https://github.com/NixOS/nixpkgs/blob/9100366975cd576a7f0a660f9f358ff2f0d5361a/pkgs/build-support/lib/cmake.nix
  cmakeFlags' = optionals (stdenv.hostPlatform != stdenv.buildPlatform) (
    [
      "-DCMAKE_SYSTEM_NAME=${
        findFirst isString "Generic" (
          optional (!stdenv.hostPlatform.isRedox) stdenv.hostPlatform.uname.system
        )
      }"
    ]
    ++ optionals (stdenv.hostPlatform.uname.processor != null) [
      "-DCMAKE_SYSTEM_PROCESSOR=${stdenv.hostPlatform.uname.processor}"
    ]
    ++ optionals (stdenv.hostPlatform.uname.release != null) [
      "-DCMAKE_SYSTEM_VERSION=${stdenv.hostPlatform.uname.release}"
    ]
    ++ optionals (stdenv.hostPlatform.isDarwin) [
      "-DCMAKE_OSX_ARCHITECTURES=${stdenv.hostPlatform.darwinArch}"
    ]
    ++ optionals (stdenv.buildPlatform.uname.system != null) [
      "-DCMAKE_HOST_SYSTEM_NAME=${stdenv.buildPlatform.uname.system}"
    ]
    ++ optionals (stdenv.buildPlatform.uname.processor != null) [
      "-DCMAKE_HOST_SYSTEM_PROCESSOR=${stdenv.buildPlatform.uname.processor}"
    ]
    ++ optionals (stdenv.buildPlatform.uname.release != null) [
      "-DCMAKE_HOST_SYSTEM_VERSION=${stdenv.buildPlatform.uname.release}"
    ]
    ++ optionals (stdenv.buildPlatform.canExecute stdenv.hostPlatform) [
      "-DCMAKE_CROSSCOMPILING_EMULATOR=env"
    ]
    ++ optionals stdenv.hostPlatform.isStatic [
      "-DCMAKE_LINK_SEARCH_START_STATIC=ON"
    ]
  );
in
mkRecursiveBuilder buildColconPackage (
  finalDrv: finalAttrs:
  {
    nativeBuildInputs ? [ ],
    colconFlags ? [ ],
    ...
  }@args:
  let
    doCheck = finalDrv.doCheck;
    cmakeFlags = finalDrv.cmakeFlags or [ ];
  in
  args
  // {
    nativeBuildInputs =
      nativeBuildInputs
      ++ [ buildPackages.cmake ]
      ++ (with buildPackages.pythonForRosPackages; [ colcon-ros ]);
    colconFlags =
      colconFlags
      ++ [
        "--cmake-args"
      ]
      ++ (map (arg: " ${arg}") (
        [
          "-DBUILD_TESTING=${if doCheck then "ON" else "OFF"}"
        ]
        ++ cmakeFlags'
        ++ cmakeFlags
      ));
  }
)
