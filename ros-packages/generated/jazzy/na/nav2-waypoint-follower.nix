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
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_waypoint_follower";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geographic-msgs image-transport nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle robot-localization tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_waypoint_follower" = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4bcfdf85d10f47b2b4bcbe70396760cca2179cac";
        hash = "sha256-0cPwsMkkdfBs2TSkEXhAAb8zXuAV6PGIsyG4GzUdLxw=";
      };
    };
  });
  meta = {
    description = "A waypoint follower navigation server";
  };
})
