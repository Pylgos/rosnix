{
  ament-cmake,
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
  pname = "nav2_planner";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b8022bf14a687233a4657a3211bd171f771a5fb7";
        hash = "sha256-rPC98uiK4rJQE+YKftzC8D06amwQyyHuzm9vuSllqq0=";
      };
    };
  });
  meta = {
    description = "Nav2 planner server package";
  };
})
