{
  ament-cmake,
  buildAmentCmakePackage,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-examples,
  depthai-filters,
  depthai-ros-driver,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai-ros";
  version = "3.0.10-1";
  src = finalAttrs.passthru.sources."depthai-ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ depthai depthai-bridge depthai-descriptions depthai-examples depthai-filters depthai-ros-driver depthai-ros-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ depthai depthai-bridge depthai-descriptions depthai-examples depthai-filters depthai-ros-driver depthai-ros-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai-ros" = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "4a408b706e94e8337b55d373ad0c8dc2f9da5414";
        hash = "sha256-ZPkeb0hYk9uAdg7lKzcxfpHRNxuZb/OL1CFlbtbOiOA=";
      };
    };
  });
  meta = {
    description = "The depthai-ros package";
  };
})
