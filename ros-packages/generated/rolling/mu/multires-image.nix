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
  version = "2.5.10-1";
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
        rev = "4f9180536dcbd6e341f0b1bb12dc0638c4a04a9b";
        hash = "sha256-T3ljC1VPjj7SLEnhH8mqkafVrpWg31Uvs/ZT4amytAE=";
      };
    };
  });
  meta = {
    description = "\n\n     multires_image\n\n  ";
  };
})
