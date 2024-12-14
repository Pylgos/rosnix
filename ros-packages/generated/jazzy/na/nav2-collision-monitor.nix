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
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_collision_monitor";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_collision_monitor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-msgs nav2-util rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_collision_monitor" = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "721d72c7a366fdffecd65a3cb8d4c81236c8b491";
        hash = "sha256-o2WZWwhugF4m0soixKXJO2ZewH5kt9OaS4jvg36w+cc=";
      };
    };
  });
  meta = {
    description = "Collision Monitor";
  };
})
