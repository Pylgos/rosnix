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
  version = "3.1.0-1";
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
        rev = "effa2019c8385405e764b2aac55129c05b32ef20";
        hash = "sha256-78DsQ5pf+42TRSS0X7jb58XKyBdbPUeZJodep7PV0Qk=";
      };
    };
  });
  meta = {
    description = "The depthai-ros package";
  };
})
