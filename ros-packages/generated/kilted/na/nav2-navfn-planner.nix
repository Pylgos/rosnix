{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_navfn_planner";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_navfn_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_navfn_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_navfn_planner-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "2ed80177f61edaa8ec8f098471d9eb5e3fad8f8b";
        hash = "sha256-/VosfCIGXZjMUwGQyGXvUEbgm5sObmpnFf3JmcsHn7A=";
      };
    };
  });
  meta = {
    description = "Nav2 NavFn planner";
  };
})
