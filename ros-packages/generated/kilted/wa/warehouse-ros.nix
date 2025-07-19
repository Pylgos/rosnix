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
  version = "2.0.5-2";
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
        rev = "6a1d1057cfb7ca7be925794ff74a1f186584041a";
        hash = "sha256-X45/qATzogkTqKBnEvt1wH7hKl9/qSTTVboEsAuL/Es=";
      };
    };
  });
  meta = {
    description = "Persistent storage of ROS messages";
  };
})
