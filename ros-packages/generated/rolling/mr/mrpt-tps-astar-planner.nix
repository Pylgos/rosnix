{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libnav,
  mrpt-libros-bridge,
  mrpt-msgs,
  mrpt-nav-interfaces,
  mrpt-path-planning,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_tps_astar_planner";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_tps_astar_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libros-bridge mrpt-msgs mrpt-nav-interfaces mrpt-path-planning nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_tps_astar_planner" = substituteSource {
      src = fetchgit {
        name = "mrpt_tps_astar_planner-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "742b0e9b9aeb201a095577d1456358fc5f82c298";
        hash = "sha256-Ks13fdjdQxTBr9f9vORbnJAHopRtziGX+H2mqFiv0uM=";
      };
    };
  });
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
})
