{
  ament_cmake,
  buildRosPackage,
  color_util,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pluginlib,
  polygon_msgs,
  polygon_utils,
  rosSystemPackages,
  rviz_common,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    polygon_rviz_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "polygon_rviz_plugins-source";
        owner = "ros2-gbp";
        repo = "polygon_ros-release";
        rev = "a374e3b90d7508c96a78eb18fd2b7afcd9274720";
        hash = "sha256-kXUTcZF3KsFumuXqXCeIaMwhTxL4CWEfmRduy9+Uiq4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_rviz_plugins";
  version = "1.1.0-1";
  src = sources.polygon_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ color_util geometry_msgs pluginlib polygon_msgs polygon_utils rviz_common std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RViz visualizations for polygons";
  };
}
