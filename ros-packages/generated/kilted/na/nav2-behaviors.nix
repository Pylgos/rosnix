{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_behaviors";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_behaviors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-components rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-components rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_behaviors" = substituteSource {
      src = fetchgit {
        name = "nav2_behaviors-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "b925d29f18c59df20c3d8ef9986f895a921c549c";
        hash = "sha256-/ksnPeOWe/oDJW4+HL6MI4BX4fr9TEeVJUwUMuRQS90=";
      };
    };
  });
  meta = {
    description = "Nav2 behavior server";
  };
})
