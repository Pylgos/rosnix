{
  mkRecursiveBuilder,
  buildColconPackage,
  buildPackages,
}:

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
        " -DBUILD_TESTING=${if doCheck then "ON" else "OFF"}"
      ]
      ++ (map (arg: " ${arg}") cmakeFlags);
  }
)
