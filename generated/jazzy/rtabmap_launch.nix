{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rtabmap_msgs,
  rtabmap_odom,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_launch = substituteSource {
      src = fetchgit {
        name = "rtabmap_launch-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "5b675f991f98eb31cad809c61c7cf21d894a8fd8";
        hash = "sha256-Z77TwsTvqp+PI9PQg6x5I4H9l7ksyJJL4lJUuR/1r5o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_launch";
  version = "0.21.5-3";
  src = sources.rtabmap_launch;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rtabmap_msgs rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map's main launch files.";
  };
}
