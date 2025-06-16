{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "multires_image";
  version = "2.5.6-1";
  src = finalAttrs.passthru.sources."multires_image";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt5-qmake" ]; };
  propagatedNativeBuildInputs = [ geometry-msgs mapviz pluginlib rclcpp rclpy swri-math-util swri-transform-util tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ geometry-msgs mapviz pluginlib rclcpp rclpy swri-math-util swri-transform-util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "multires_image" = substituteSource {
      src = fetchgit {
        name = "multires_image-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "78c55f216a6a05884a5f26aeb914cfeabae87fdb";
        hash = "sha256-iw/8HFt0UVHAriJcDx7ggN1QWGwmHgwQsirJfiVXmBg=";
      };
    };
  });
  meta = {
    description = "\n\n     multires_image\n\n  ";
  };
})
