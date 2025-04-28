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
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."desktop_full";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ desktop perception ros-gz-sim-demos simulation ];
  passthru.sources = mkSourceSet (sources: {
    "desktop_full" = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "abb63c09df64146a15185018576a05376a2fb419";
        hash = "sha256-ubSR4qak1PeRtcru0JTtE+H8TMn734/JG7Z09aQAjbg=";
      };
    };
  });
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
})
