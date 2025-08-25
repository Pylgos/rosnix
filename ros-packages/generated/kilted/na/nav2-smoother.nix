{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-utils,
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
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_smoother";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-utils pluginlib rclcpp rclcpp-components rclcpp-lifecycle tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-utils pluginlib rclcpp rclcpp-components rclcpp-lifecycle tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_smoother-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "d94f60a8311636eeac727805fd9a99576a912af1";
        hash = "sha256-nd9l9J1wet/ottWqHjmU8xX2jK75tgAvYl7xEMvM9zQ=";
      };
    };
  });
  meta = {
    description = "Smoother action interface";
  };
})
