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
  version = "0.2.5-1";
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
        rev = "828c6f1ca0e6dff2da685b7ac53df664d80e224b";
        hash = "sha256-nRLcpUPPYVlWHveGchTpS0tDNaJfTLJgdhfZxi/3u2g=";
      };
    };
  });
  meta = {
    description = "Conversions between navmap_core and ROS messages";
  };
})
