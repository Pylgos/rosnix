{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rtabmap_conversions,
  rtabmap_demos,
  rtabmap_examples,
  rtabmap_launch,
  rtabmap_msgs,
  rtabmap_odom,
  rtabmap_python,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_sync,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_ros = substituteSource {
      src = fetchFromGitHub {
        name = "rtabmap_ros-source";
        owner = "introlab";
        repo = "rtabmap_ros-release";
        rev = "0657471e1353d3541447a2cc2b00271aaf695972";
        hash = "sha256-lfDi9FGpg8jfzKpZviZiOi54jP4uySFHVV8G+LS66U4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_ros";
  version = "0.21.5-3";
  src = sources.rtabmap_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rtabmap_conversions rtabmap_demos rtabmap_examples rtabmap_launch rtabmap_msgs rtabmap_odom rtabmap_python rtabmap_rviz_plugins rtabmap_slam rtabmap_sync rtabmap_util rtabmap_viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map Stack";
  };
}
