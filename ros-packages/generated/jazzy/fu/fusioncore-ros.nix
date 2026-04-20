{
  ament-cmake,
  buildAmentCmakePackage,
  compass-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  fusioncore-core,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_ros";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."fusioncore_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ compass-msgs eigen3-cmake-module fusioncore-core geometry-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compass-msgs eigen3-cmake-module fusioncore-core geometry-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_ros" = substituteSource {
      src = fetchgit {
        name = "fusioncore_ros-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "b6c4336d82116328369faff88a712ee72dccaac6";
        hash = "sha256-Kc6jzZOYAtCsOaQOltdsCJfgwJEtsP/Ouk+PdNyFQ/E=";
      };
    };
  });
  meta = {
    description = "FusionCore ROS 2 Jazzy wrapper — sensor fusion node";
  };
})
