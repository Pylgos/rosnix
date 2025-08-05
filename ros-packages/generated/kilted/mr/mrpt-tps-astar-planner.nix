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
  version = "2.2.4-1";
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
        rev = "c860c936c3e6bac53326575a852a81ce61e3f0f3";
        hash = "sha256-GiWd7AqdzUgttgbYdn3r3N50Ap/8YM14VFrsYlHIP4U=";
      };
    };
  });
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
})
