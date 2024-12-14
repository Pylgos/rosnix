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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_dwb_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ costmap-queue dwb-core dwb-critics dwb-msgs dwb-plugins nav-2d-msgs nav-2d-utils ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_dwb_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_dwb_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d502734184af4497324cde9bf11ec224ec357a01";
        hash = "sha256-aDUg48FKlsnBeXiqZkWswrwirJtnOxwH1yEci+Ca7Ck=";
      };
    };
  });
  meta = {
    description = "ROS2 controller (DWB) metapackage";
  };
})
