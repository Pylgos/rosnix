{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  robot-localization,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_waypoint_follower";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_waypoint_follower";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geographic-msgs image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle robot-localization tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geographic-msgs image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle robot-localization tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_waypoint_follower" = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "85d6533eb37748cac372704a3d99d694f51ce187";
        hash = "sha256-Vv8ncVuqzYKL0oC6aA3/5ikDF+iIPatcYR5X1pu8sA8=";
      };
    };
  });
  meta = {
    description = "A waypoint follower navigation server";
  };
})
