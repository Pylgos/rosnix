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
  multisensor-calibration-interface,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rviz-common,
  sensor-msgs,
  small-gicp-vendor,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  urdf,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "multisensor_calibration";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."multisensor_calibration";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport multisensor-calibration-interface pcl-conversions pcl-ros rclcpp rclcpp-components rviz-common sensor-msgs small-gicp-vendor std-msgs tf2 tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qt5-qmake" "qtbase5-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport multisensor-calibration-interface pcl-conversions pcl-ros rclcpp rclcpp-components rviz-common sensor-msgs small-gicp-vendor std-msgs tf2 tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qt5-qmake" "qtbase5-dev" "tinyxml2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "multisensor_calibration" = substituteSource {
      src = fetchgit {
        name = "multisensor_calibration-source";
        url = "https://github.com/ros2-gbp/multisensor_calibration-release.git";
        rev = "7c887ba2afae013c3f309f2f0f1bd72a2a2f2efb";
        hash = "sha256-9lIrfB4xFkjFcP50QbKde2GDQJlSwt658hRRwDl9f0k=";
      };
    };
  });
  meta = {
    description = "\n    Collection of methods and applications to calibrate multi-sensor-systems, e.g.\n    camera to LiDAR, LiDAR to LiDAR, and LiDAR to vehicle. \n  ";
  };
})
