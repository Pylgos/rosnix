{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  mapviz,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  swri-math-util,
  swri-transform-util,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "multires_image";
  version = "2.4.8-1";
  src = finalAttrs.passthru.sources."multires_image";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt5-qmake" ]; };
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs gps-msgs mapviz pluginlib rclcpp rclpy swri-math-util swri-transform-util tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs gps-msgs mapviz pluginlib rclcpp rclpy swri-math-util swri-transform-util tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "multires_image" = substituteSource {
      src = fetchgit {
        name = "multires_image-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "02e5b0e19e63945a112744d09fe3a9fa271830fa";
        hash = "sha256-LtWmvu7UBS/tobZGozVzovJLu3qMiqiUOWbgGPBKRY4=";
      };
    };
  });
  meta = {
    description = "\n\n     multires_image\n\n  ";
  };
})
