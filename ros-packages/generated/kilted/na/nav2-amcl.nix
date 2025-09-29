{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-components,
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
  pname = "nav2_amcl";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters nav2-common nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs message-filters nav2-common nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_amcl" = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "b3ef4259d3031003e8b48b58560875e6995c01f0";
        hash = "sha256-3st1lYJFFWTV8aiypfJK804AO4MdWsn4ZX3j1IxTvHA=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
