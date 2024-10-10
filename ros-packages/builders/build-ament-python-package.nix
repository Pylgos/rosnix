{
  mkRecursiveBuilder,
  buildColconPackage,
  buildPackages,
}:

mkRecursiveBuilder buildColconPackage (
  finalDrv: finalAttrs:
  {
    nativeBuildInputs ? [ ],
    ...
  }:
  {
    nativeBuildInputs = nativeBuildInputs ++ (with buildPackages.pythonForRosPackages; [ colcon-ros ]);
  }
)
