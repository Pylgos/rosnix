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
  version = "3.0.5-1";
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
        rev = "755700cdf8ee2b3e1663df723682b1c8ffabacbb";
        hash = "sha256-RrFubFruERR5jR7F8ngMsMiTJfXATuF+mj7nQ48mrv8=";
      };
    };
  });
  meta = {
    description = "The depthai-ros package";
  };
})
