{
  ament_cmake,
  automotive_navigation_msgs,
  automotive_platform_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    automotive_autonomy_msgs-97aaee185824885492b7f80ff6bbd484509200b4 = substituteSource {
      src = fetchgit {
        name = "automotive_autonomy_msgs-97aaee185824885492b7f80ff6bbd484509200b4-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "97aaee185824885492b7f80ff6bbd484509200b4";
        hash = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_autonomy_msgs";
  version = "3.0.4-5";
  src = sources.automotive_autonomy_msgs-97aaee185824885492b7f80ff6bbd484509200b4;
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
