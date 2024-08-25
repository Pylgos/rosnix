{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
      src = fetchgit {
        name = "rtabmap_ros-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rtabmap_conversions rtabmap_demos rtabmap_examples rtabmap_launch rtabmap_msgs rtabmap_odom rtabmap_python rtabmap_rviz_plugins rtabmap_slam rtabmap_sync rtabmap_util rtabmap_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map Stack";
  };
}
