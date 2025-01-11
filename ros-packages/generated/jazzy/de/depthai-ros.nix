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
  version = "2.10.5-1";
  src = finalAttrs.passthru.sources."depthai-ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ depthai depthai-bridge depthai-descriptions depthai-examples depthai-filters depthai-ros-driver depthai-ros-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai-ros" = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "e05e77e6b4b4c668d4a99030220fce9ef68df761";
        hash = "sha256-A9Jrlb6p8FJsIbZHvYVuppoTEZHwBKZ86t2usZISCbM=";
      };
    };
  });
  meta = {
    description = "The depthai-ros package";
  };
})
