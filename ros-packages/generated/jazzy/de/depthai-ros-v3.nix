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
  version = "3.2.0-1";
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
        rev = "4e12b2dcdb7cb8f55612b3ed93a9f310a86f99e0";
        hash = "sha256-TezWf2jp7pCF5bTl/VIIJiUAxBxY1zGDlAczzcfsWhY=";
      };
    };
  });
  meta = {
    description = "The depthai_ros_v3 package";
  };
})
