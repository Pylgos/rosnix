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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_viz" = substituteSource {
      src = fetchgit {
        name = "rtabmap_viz-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8d9bf16deffce84381687865b534ed62831ec31b";
        hash = "sha256-YVnsbaWA4A2a128oGrZlGYSA49PYnfPv4WXw5xf4FfM=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's visualization package.";
  };
})
