{
  ament_cmake,
  automotive_navigation_msgs,
  automotive_platform_msgs,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    automotive_autonomy_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "automotive_autonomy_msgs-source";
        owner = "ros2-gbp";
        repo = "automotive_autonomy_msgs-release";
        rev = "34fc7813acfef2ff1efba213b734f4fb35656208";
        hash = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_autonomy_msgs";
  version = "3.0.4-6";
  src = sources.automotive_autonomy_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ automotive_navigation_msgs automotive_platform_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for vehicle automation";
  };
}
