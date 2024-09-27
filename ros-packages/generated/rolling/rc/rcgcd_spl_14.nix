{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rcgcd_spl_14-14641993d5af11a694a02d4e4798214d1318ec41 = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14-14641993d5af11a694a02d4e4798214d1318ec41-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "14641993d5af11a694a02d4e4798214d1318ec41";
        hash = "sha256-naRnWiBaNmsQqaucIPL28thbmjie8mBvwk3zLJibvQA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14";
  version = "4.0.1-1";
  src = sources.rcgcd_spl_14-14641993d5af11a694a02d4e4798214d1318ec41;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup SPL GameController Data V14 ROS msg";
  };
}
