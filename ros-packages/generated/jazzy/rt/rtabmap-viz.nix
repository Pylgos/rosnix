{
  ament-cmake-ros,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rtabmap-msgs,
  rtabmap-sync,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_viz";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_viz" = substituteSource {
      src = fetchgit {
        name = "rtabmap_viz-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "ff273d3e82846a7e53c1e8df38965fa63da81d44";
        hash = "sha256-4xnXI70dIknAoZ1X3f8daoIxfK6QEgZl3LOwWAtKLd0=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's visualization package.";
  };
})
