{
  buildColconPackage,
  buildPackages,
  mkRecursiveBuilder,
  pythonForRos,
}:

mkRecursiveBuilder buildColconPackage (
  finalDrv: finalAttrs:
  {
    nativeBuildInputs ? [ ],
    ...
  }:
  {
    nativeBuildInputs =
      nativeBuildInputs ++ (with buildPackages.pythonForRosPackages; [ colcon-ros ]) ++ [ pythonForRos ];
  }
)
