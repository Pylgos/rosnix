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
  ros-environment,
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
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp ros-environment rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp ros-environment rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_viz" = substituteSource {
      src = fetchgit {
        name = "rtabmap_viz-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "c8ddbaea48469b990b1f49e691f0b862e896c7d6";
        hash = "sha256-4QE16HlIdpjAPg7YdOYAnnlgno7TLPc6Gcmmq/V5VxE=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's visualization package.";
  };
})
