{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  navmap-core,
  navmap-ros-interfaces,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_ros";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."navmap_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs navmap-core navmap-ros-interfaces pcl-conversions pcl-ros rclcpp sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs navmap-core navmap-ros-interfaces pcl-conversions pcl-ros rclcpp sensor-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_ros" = substituteSource {
      src = fetchgit {
        name = "navmap_ros-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "a11e625d3a9ba6e98a36f8db49265896ae9c6142";
        hash = "sha256-ie1CzmnsVVCmZXVM0CvPchI7ovpM2D5yZAGcAnBEzME=";
      };
    };
  });
  meta = {
    description = "Conversions between navmap_core and ROS messages";
  };
})
