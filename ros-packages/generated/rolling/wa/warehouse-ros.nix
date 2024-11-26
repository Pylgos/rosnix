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
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."warehouse_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs pluginlib rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "warehouse_ros" = substituteSource {
        src = fetchgit {
          name = "warehouse_ros-source";
          url = "https://github.com/ros2-gbp/warehouse_ros-release.git";
          rev = "bf9c959640a5ea9429eb8373608127fcf8c63981";
          hash = "sha256-X45/qATzogkTqKBnEvt1wH7hKl9/qSTTVboEsAuL/Es=";
        };
      };
    });
  };
  meta = {
    description = "Persistent storage of ROS messages";
  };
})
