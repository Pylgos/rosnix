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
  version = "1.3.11-1";
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
        rev = "e1e8b8dd185f36ae0e9557f3a9c5660aa2a4ef17";
        hash = "sha256-8CljacA5i+H3pl5JjnOM/sJSF2odhZR9NXrhN5wG1nw=";
      };
    };
  });
  meta = {
    description = "A waypoint follower navigation server";
  };
})
