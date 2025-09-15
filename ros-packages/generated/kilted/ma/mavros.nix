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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."mavros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen3-cmake-module eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rclpy rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "libconsole-bridge-dev" "python3-click" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen3-cmake-module eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rclpy rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "libconsole-bridge-dev" "python3-click" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mavros" = substituteSource {
      src = fetchgit {
        name = "mavros-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "ef9a8306bc895071c42a3515c7aad57c4037dc2f";
        hash = "sha256-VHqMKD3VQNkgVnqYMMHpU1U0Ew5uBb20XQ8rBQBcqBc=";
      };
    };
  });
  meta = {
    description = "\n    MAVROS -- MAVLink extendable communication node for ROS\n    with proxy for Ground Control Station.\n  ";
  };
})
