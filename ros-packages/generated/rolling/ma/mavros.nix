{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  eigen-stl-containers,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  libmavconn,
  mavlink,
  mavros-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclpy,
  rcpputils,
  rosSystemPackages,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mavros";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."mavros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rclpy rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "libconsole-bridge-dev" "python3-click" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mavros" = substituteSource {
      src = fetchgit {
        name = "mavros-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "c6ecb5e6a5492d148e2fc5bc641d748aeef31e27";
        hash = "sha256-XUyfVLBaGJ1TzSBTKVS2jkfH/FiNVYvIzwhgG47Fh+8=";
      };
    };
  });
  meta = {
    description = "MAVROS -- MAVLink extendable communication node for ROS with proxy for Ground Control Station.";
  };
})
