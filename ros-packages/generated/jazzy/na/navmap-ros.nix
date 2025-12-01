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
  version = "0.3.0-1";
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
        rev = "81ff67649fbf6faf17680838306af6272177ae61";
        hash = "sha256-66XA5LJ2kq2+hlXxmRJ8DZ4yJSPr3RI94llArw0gCOQ=";
      };
    };
  });
  meta = {
    description = "Conversions between navmap_core and ROS messages";
  };
})
