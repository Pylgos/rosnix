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
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rtabmap_viz" = substituteSource {
        src = fetchgit {
          name = "rtabmap_viz-source";
          url = "https://github.com/introlab/rtabmap_ros-release.git";
          rev = "95c83fa8acd187ccd7be6fd8ca6682afb4c16722";
          hash = "sha256-i/Ejwe1AqGUqr5YWHKW0QY/bMtLwiWrtUd/S6kdAw8Q=";
        };
      };
    });
  };
  meta = {
    description = "RTAB-Map's visualization package.";
  };
})
