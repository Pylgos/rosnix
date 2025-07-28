{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  qt-gui-cpp,
  rclcpp,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_view";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rqt_image_view";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_view" = substituteSource {
      src = fetchgit {
        name = "rqt_image_view-source";
        url = "https://github.com/ros2-gbp/rqt_image_view-release.git";
        rev = "d0a62c6d0f1159759824f1c0bc399d45b54ca2d3";
        hash = "sha256-rHa7CAczrTVggSpoJxrPu+C6fy22EGZVxKiwDdNRM5s=";
      };
    };
  });
  meta = {
    description = "rqt_image_view provides a GUI plugin for displaying images using image_transport.";
  };
})
