{
  ament-cmake,
  buildAmentCmakePackage,
  compass-msgs,
  diagnostic-msgs,
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
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_ros";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."fusioncore_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ compass-msgs diagnostic-msgs eigen3-cmake-module fusioncore-core geometry-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "proj" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compass-msgs diagnostic-msgs eigen3-cmake-module fusioncore-core geometry-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "proj" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_ros" = substituteSource {
      src = fetchgit {
        name = "fusioncore_ros-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "d8f5f9e624ce8c7b4b3f6dd1edc56b7078da82bb";
        hash = "sha256-EMvkU1fRKys3U6Atm2qL1/5w1aiy3XZTpZlGTXqWMJ4=";
      };
    };
  });
  meta = {
    description = "FusionCore ROS 2 Jazzy wrapper: sensor fusion node";
  };
})
