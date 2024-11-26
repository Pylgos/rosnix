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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "multires_image";
  version = "2.4.3-1";
  src = finalAttrs.passthru.sources."multires_image";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs gps-msgs mapviz pluginlib rclcpp rclpy swri-math-util swri-transform-util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "multires_image" = substituteSource {
        src = fetchgit {
          name = "multires_image-source";
          url = "https://github.com/ros2-gbp/mapviz-release.git";
          rev = "e0614f4cde3b32425acd04442cafd0cd09e13e14";
          hash = "sha256-9pk2CCnuJ9zrlzTV6VbLsfXzML4EBn2WCg0/cW1me58=";
        };
      };
    });
  };
  meta = {
    description = "multires_image";
  };
})
