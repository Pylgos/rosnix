{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rcgcd_spl_14" = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "14641993d5af11a694a02d4e4798214d1318ec41";
        hash = "sha256-naRnWiBaNmsQqaucIPL28thbmjie8mBvwk3zLJibvQA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcgcd_spl_14";
  version = "4.0.1-1";
  src = sources."rcgcd_spl_14";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup SPL GameController Data V14 ROS msg";
  };
}
