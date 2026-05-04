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
  version = "0.13.0-2";
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
        rev = "24172f991834bd07aa421e2e532b01e00649fcf1";
        hash = "sha256-ubSR4qak1PeRtcru0JTtE+H8TMn734/JG7Z09aQAjbg=";
      };
    };
  });
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
})
