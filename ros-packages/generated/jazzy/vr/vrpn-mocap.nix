{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  vrpn,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vrpn_mocap";
  version = "1.1.0-4";
  src = finalAttrs.passthru.sources."vrpn_mocap";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp std-msgs tf2 vrpn ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs rclcpp std-msgs tf2 vrpn ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vrpn_mocap" = substituteSource {
      src = fetchgit {
        name = "vrpn_mocap-source";
        url = "https://github.com/ros2-gbp/vrpn_mocap-release.git";
        rev = "27cc8261b8a41745047892d33a03c323ca565e8d";
        hash = "sha256-qTdwB+YAkx59icepyKJgOykWlxF7kMMSSJ/EKm+NVWs=";
      };
    };
  });
  meta = {
    description = "\n    ROS2 ";
  };
})
