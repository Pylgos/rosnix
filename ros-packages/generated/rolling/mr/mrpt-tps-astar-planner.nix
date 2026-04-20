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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."mrpt_tps_astar_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libros-bridge mrpt-msgs mrpt-nav-interfaces mrpt-path-planning nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libros-bridge mrpt-msgs mrpt-nav-interfaces mrpt-path-planning nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_tps_astar_planner" = substituteSource {
      src = fetchgit {
        name = "mrpt_tps_astar_planner-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "c4244a121c6cf39471a6834179356760bd31423e";
        hash = "sha256-Xpl8Pado+dzCxEBorixdyC2FpAvmOHiwFRBcEH/eB5A=";
      };
    };
  });
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
})
