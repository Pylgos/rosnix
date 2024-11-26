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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "fe35673ad02d3b7a28fa26243a497776bc906f3c";
        hash = "sha256-RIkTyhRs52GP7v+j5+1ddXmf14KcAqhB9cmYTTIQSqo=";
      };
    };
  });
  meta = {
    description = "Nav2 planner server package";
  };
})
