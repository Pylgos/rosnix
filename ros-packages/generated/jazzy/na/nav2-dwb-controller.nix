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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "be9cd6775b1ff4add2baebcfa41d930b7b31b2cc";
        hash = "sha256-gBXHFnv0p2AZlfahyKFHrA4AG9TfqsE88Bt3nG3d//o=";
      };
    };
  });
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
})
