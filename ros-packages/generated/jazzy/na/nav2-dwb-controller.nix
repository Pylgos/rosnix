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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_dwb_controller";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "143f02a5bdcee7faf9709421c80c5dc4b8dc3c77";
        hash = "sha256-dGVGNkoLZkLdBdSPjJz00eIicQ7lmDfQZKTWyPP6PGs=";
      };
    };
  });
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
})
