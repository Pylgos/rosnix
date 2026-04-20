{
  ament-cmake,
  buildAmentCmakePackage,
  depthai-bridge-v3,
  depthai-descriptions-v3,
  depthai-examples-v3,
  depthai-filters-v3,
  depthai-ros-driver-v3,
  depthai-ros-msgs-v3,
  depthai-v3,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_ros_v3";
  version = "3.1.1-2";
  src = finalAttrs.passthru.sources."depthai_ros_v3";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ depthai-bridge-v3 depthai-descriptions-v3 depthai-examples-v3 depthai-filters-v3 depthai-ros-driver-v3 depthai-ros-msgs-v3 depthai-v3 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ depthai-bridge-v3 depthai-descriptions-v3 depthai-examples-v3 depthai-filters-v3 depthai-ros-driver-v3 depthai-ros-msgs-v3 depthai-v3 ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "8a3f99d69474e8b044f09e6074e6e25ae0b074e9";
        hash = "sha256-fN/XiASM6OIsb1sAhDfo2SesqS0nCE4Cu8ac9yDXRRE=";
      };
    };
  });
  meta = {
    description = "The depthai_ros_v3 package";
  };
})
