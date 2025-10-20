{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
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
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."navmap_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs navmap-core navmap-ros-interfaces pcl-conversions pcl-ros rclcpp sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs navmap-core navmap-ros-interfaces pcl-conversions pcl-ros rclcpp sensor-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_ros" = substituteSource {
      src = fetchgit {
        name = "navmap_ros-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "1f76df119b5f2b4325d4c1964f26ab3fae77c031";
        hash = "sha256-4nIUslMVRXyAgSZdR3ljWuXUcT7jkx/KKw/As7GPxXU=";
      };
    };
  });
  meta = {
    description = "Conversions between navmap_core and ROS messages";
  };
})
