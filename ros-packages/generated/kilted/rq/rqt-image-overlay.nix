{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  compressed-image-transport,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-image-to-qimage,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  rqt-image-overlay-layer,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_overlay";
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."rqt_image_overlay";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ image-transport pluginlib rclcpp ros-image-to-qimage rqt-gui rqt-gui-cpp rqt-image-overlay-layer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport pluginlib rclcpp ros-image-to-qimage rqt-gui rqt-gui-cpp rqt-image-overlay-layer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common compressed-image-transport std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_overlay" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "98011b5d851d0d221d9cfa1ee5fc87b51da58411";
        hash = "sha256-IrZimFGQ4HoVsT+LcqrJQhwy4Y9DiMUWjZ4Kltdjah8=";
      };
    };
  });
  meta = {
    description = "An rqt plugin to display overlays for custom msgs on an image using plugins.";
  };
})
