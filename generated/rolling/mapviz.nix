{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  mapviz_interfaces,
  marti_common_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rqt_gui,
  rqt_gui_cpp,
  std_srvs,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    mapviz = substituteSource {
      src = fetchgit {
        name = "mapviz-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "4284526bed342d5b19243bc6d10a714daed5f320";
        hash = "sha256-QOavYJZ21V7PB+K2MI7j0uEWX1GmRRIocdvdSs2ZfP0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz";
  version = "2.3.0-2";
  src = sources.mapviz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_transport mapviz_interfaces marti_common_msgs pluginlib rclcpp rqt_gui rqt_gui_cpp std_srvs swri_math_util swri_transform_util tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "libglew-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "libxi-dev" "libxmu-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "mapviz";
  };
}
