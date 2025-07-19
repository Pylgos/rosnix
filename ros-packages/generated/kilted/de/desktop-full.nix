{
  ament-cmake,
  buildAmentCmakePackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  perception,
  ros-gz-sim-demos,
  rosSystemPackages,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "desktop_full";
  version = "0.12.0-2";
  src = finalAttrs.passthru.sources."desktop_full";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ desktop perception ros-gz-sim-demos simulation ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ desktop perception ros-gz-sim-demos simulation ];
  passthru.sources = mkSourceSet (sources: {
    "desktop_full" = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "6a0682436bf73f996267329cc0334f0b9005c6d3";
        hash = "sha256-+s6z0+4bXLNuEWFO5S3mDwdyz4GTUmJrRTxOwTLQqqI=";
      };
    };
  });
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
})
