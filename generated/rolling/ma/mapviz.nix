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
    mapviz-209a4127774e8c8ef5b0a4ddd329b95458f10b0b = substituteSource {
      src = fetchgit {
        name = "mapviz-209a4127774e8c8ef5b0a4ddd329b95458f10b0b-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "209a4127774e8c8ef5b0a4ddd329b95458f10b0b";
        hash = "sha256-OhfuhW6844KCy+wJF+YuGhGnEIRRoZNvHAUkYOa1408=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz";
  version = "2.4.3-1";
  src = sources.mapviz-209a4127774e8c8ef5b0a4ddd329b95458f10b0b;
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
