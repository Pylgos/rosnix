{
  ament-cmake,
  ament-cmake-copyright,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "warehouse_ros";
  version = "2.0.6-2";
  src = finalAttrs.passthru.sources."warehouse_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs pluginlib rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libssl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs pluginlib rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "warehouse_ros" = substituteSource {
      src = fetchgit {
        name = "warehouse_ros-source";
        url = "https://github.com/ros2-gbp/warehouse_ros-release.git";
        rev = "af46458239d99e3e962ea5fc54cc8413146aa7db";
        hash = "sha256-+4sr1KGmHmgV8y4hqv8gL38FLO2QUKRv6ApI8B81t6A=";
      };
    };
  });
  meta = {
    description = "Persistent storage of ROS messages";
  };
})
