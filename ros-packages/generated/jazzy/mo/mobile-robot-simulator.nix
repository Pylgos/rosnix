{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rosgraph-msgs,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mobile_robot_simulator";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."mobile_robot_simulator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rosgraph-msgs sensor-msgs tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rosgraph-msgs sensor-msgs tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mobile_robot_simulator" = substituteSource {
      src = fetchgit {
        name = "mobile_robot_simulator-source";
        url = "https://github.com/nobleo/mobile_robot_simulator-release.git";
        rev = "d1fbe860f7c922b709b85c17c390ac5f060dd528";
        hash = "sha256-QdYMi0Sw6Ene76znAVugJQAdQqEenhhmk4UHLRX3fqA=";
      };
    };
  });
  meta = {
    description = "The mobile_robot_simulator package";
  };
})
