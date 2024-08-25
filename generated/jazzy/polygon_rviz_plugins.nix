{
  ament_cmake,
  buildRosPackage,
  color_util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pluginlib,
  polygon_msgs,
  polygon_utils,
  rviz_common,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    polygon_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "polygon_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "0d1284be8b4cd9977d6cbb8f4432ce8ad065a77e";
        hash = "sha256-KMmv93mqtxZNcLSOVHhFfJMCuQI8fP6NKp7mEnY5O18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_rviz_plugins";
  version = "1.0.2-3";
  src = sources.polygon_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ color_util geometry_msgs pluginlib polygon_msgs polygon_utils rviz_common std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RViz visualizations for polygons";
  };
}
