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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_view";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."rqt_image_view";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt6-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_view" = substituteSource {
      src = fetchgit {
        name = "rqt_image_view-source";
        url = "https://github.com/ros2-gbp/rqt_image_view-release.git";
        rev = "4dd47f75615a00fbda967a04a2ba4f153559908f";
        hash = "sha256-mOFV//VPx32XtJaZFUWlSzu8mgsHZRANCCS9336r6AY=";
      };
    };
  });
  meta = {
    description = "rqt_image_view provides a GUI plugin for displaying images using image_transport.";
  };
})
