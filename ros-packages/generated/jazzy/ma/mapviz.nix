{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mapviz-interfaces,
  marti-common-msgs,
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
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."mapviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport mapviz-interfaces marti-common-msgs pluginlib rclcpp rqt-gui rqt-gui-cpp std-srvs swri-math-util swri-transform-util tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "libglew-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "libxi-dev" "libxmu-dev" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mapviz" = substituteSource {
      src = fetchgit {
        name = "mapviz-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "4adb92103d0143583bfdc817e23df526bcfae5c5";
        hash = "sha256-uLDZGBD//2jbUrFdrIHl1+Ki++rYaCW7dpVOM2yCx7o=";
      };
    };
  });
  meta = {
    description = "mapviz";
  };
})
