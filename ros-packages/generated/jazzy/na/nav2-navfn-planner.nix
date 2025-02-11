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
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_navfn_planner";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_navfn_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_navfn_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_navfn_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e2475d274d9262766807231ea7bce296bccb1292";
        hash = "sha256-HapYLATSVfR1TXWrmDTLX82qKi69xig0cgmFuM8vE0Q=";
      };
    };
  });
  meta = {
    description = "Nav2 NavFn planner";
  };
})
