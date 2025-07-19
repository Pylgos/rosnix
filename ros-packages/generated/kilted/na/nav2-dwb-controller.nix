{
  ament-cmake,
  buildAmentCmakePackage,
  costmap-queue,
  dwb-core,
  dwb-critics,
  dwb-msgs,
  dwb-plugins,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_dwb_controller";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav2-common nav-2d-msgs nav-2d-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav2-common nav-2d-msgs nav-2d-utils ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "5aaf1e02b905c8f883d79fe1e4ebc4d0bc9fec16";
        hash = "sha256-Zd92Eng4i+TS2R63SrCO93uj09PSaXbpFCQKZ1V5RDE=";
      };
    };
  });
  meta = {
    description = "\n    ROS2 controller (DWB) metapackage\n  ";
  };
})
