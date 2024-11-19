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
      ]
      ++ (map (arg: " ${arg}") (
        [
          "-DBUILD_TESTING=${if doCheck then "ON" else "OFF"}"
          "-DPython3_EXECUTABLE=${buildPackages.pythonForRos.interpreter}"
        ]
        ++ cmakeFlags
      ));
  }
)
