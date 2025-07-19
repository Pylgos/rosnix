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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_viz";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_viz";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp ros-environment rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp ros-environment rtabmap-msgs rtabmap-sync std-msgs std-srvs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_viz" = substituteSource {
      src = fetchgit {
        name = "rtabmap_viz-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "f2c6329e7e09ef2e1893958386f4a9bca885605b";
        hash = "sha256-4QE16HlIdpjAPg7YdOYAnnlgno7TLPc6Gcmmq/V5VxE=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's visualization package.";
  };
})
