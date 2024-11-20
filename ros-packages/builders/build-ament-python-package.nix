{
  buildColconPackage,
  buildPackages,
  mkRecursiveBuilder,
  rosPython,
}:

mkRecursiveBuilder buildColconPackage (
  finalDrv: finalAttrs:
  {
    nativeBuildInputs ? [ ],
    ...
  }:
  {
    nativeBuildInputs =
      nativeBuildInputs ++ (with buildPackages.rosPythonPackages; [ colcon-ros ]) ++ [ rosPython ];
  }
)
