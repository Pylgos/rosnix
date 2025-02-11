{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-amcl,
  nav2-behavior-tree,
  nav2-behaviors,
  nav2-bt-navigator,
  nav2-collision-monitor,
  nav2-constrained-smoother,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-dwb-controller,
  nav2-graceful-controller,
  nav2-lifecycle-manager,
  nav2-map-server,
  nav2-mppi-controller,
  nav2-msgs,
  nav2-navfn-planner,
  nav2-planner,
  nav2-regulated-pure-pursuit-controller,
  nav2-rotation-shim-controller,
  nav2-rviz-plugins,
  nav2-simple-commander,
  nav2-smac-planner,
  nav2-smoother,
  nav2-theta-star-planner,
  nav2-util,
  nav2-velocity-smoother,
  nav2-voxel-grid,
  nav2-waypoint-follower,
  opennav-docking,
  opennav-docking-bt,
  opennav-docking-core,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navigation2";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ nav2-amcl nav2-behavior-tree nav2-behaviors nav2-bt-navigator nav2-collision-monitor nav2-constrained-smoother nav2-controller nav2-core nav2-costmap-2d nav2-dwb-controller nav2-graceful-controller nav2-lifecycle-manager nav2-map-server nav2-mppi-controller nav2-msgs nav2-navfn-planner nav2-planner nav2-regulated-pure-pursuit-controller nav2-rotation-shim-controller nav2-rviz-plugins nav2-simple-commander nav2-smac-planner nav2-smoother nav2-theta-star-planner nav2-util nav2-velocity-smoother nav2-voxel-grid nav2-waypoint-follower opennav-docking opennav-docking-bt opennav-docking-core ];
  passthru.sources = mkSourceSet (sources: {
    "navigation2" = substituteSource {
      src = fetchgit {
        name = "navigation2-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "21350cce40d4e4ad4235b9c1d919337039a6254f";
        hash = "sha256-NCjfssWvxOKV/nb1DiBv968kEBKe2mbSTlMHDhppDJ4=";
      };
    };
  });
  meta = {
    description = "ROS2 Navigation Stack";
  };
})
