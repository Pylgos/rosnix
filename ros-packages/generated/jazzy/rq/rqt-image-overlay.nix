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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rqt_image_overlay";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ image-transport pluginlib rclcpp ros-image-to-qimage rqt-gui rqt-gui-cpp rqt-image-overlay-layer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common compressed-image-transport std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_image_overlay" = substituteSource {
        src = fetchgit {
          name = "rqt_image_overlay-source";
          url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
          rev = "03d9a1ad37f8cbbbdfb5a8ec645cc3d0e0a1e5e1";
          hash = "sha256-LAM2lrgwF/+GK1yb+lQnhSBGc3u5UPeJa4dAHMg/oZM=";
        };
      };
    });
  };
  meta = {
    description = "An rqt plugin to display overlays for custom msgs on an image using plugins.";
  };
})
