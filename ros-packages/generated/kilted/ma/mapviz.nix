{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mapviz-interfaces,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  std-srvs,
  substituteSource,
  swri-math-util,
  swri-transform-util,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mapviz";
  version = "2.5.10-1";
  src = finalAttrs.passthru.sources."mapviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "qt5-qmake" ]; };
  propagatedNativeBuildInputs = [ geometry-msgs image-transport mapviz-interfaces pluginlib rclcpp ros-environment rqt-gui rqt-gui-cpp std-srvs swri-math-util swri-transform-util tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "glut" "libglew-dev" "libopencv-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "libxi-dev" "libxmu-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "qt5-qmake" ]; };
  propagatedBuildInputs = [ geometry-msgs image-transport mapviz-interfaces pluginlib rclcpp ros-environment rqt-gui rqt-gui-cpp std-srvs swri-math-util swri-transform-util tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "libglew-dev" "libopencv-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "libxi-dev" "libxmu-dev" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mapviz" = substituteSource {
      src = fetchgit {
        name = "mapviz-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "0f7230ba80193f15f0cc8fe7cdb641ea86682b0c";
        hash = "sha256-bYsj+6oY1BPDYGviyniz0vXGZZQPw8mIK1vuGhGO16s=";
      };
    };
  });
  meta = {
    description = "\n    2D mapping display with extensible data overlays \n  ";
  };
})
