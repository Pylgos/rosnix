{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-config-live,
  clearpath-offboard-sensors,
  clearpath-platform-msgs,
  clearpath-viz,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_desktop";
  version = "2.7.0-2";
  src = finalAttrs.passthru.sources."clearpath_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config-live clearpath-offboard-sensors clearpath-platform-msgs clearpath-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config-live clearpath-offboard-sensors clearpath-platform-msgs clearpath-viz ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_desktop" = substituteSource {
      src = fetchgit {
        name = "clearpath_desktop-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "8faf801801e2467cf7a806f1ae8097a3b1b989ec";
        hash = "sha256-nSmx8FmvqzLmpvCzOi3z1CGTq7avF8ia9lrgal3b7Og=";
      };
    };
  });
  meta = {
    description = "Packages for working with Clearpath Platforms from a ROS 2 desktop.";
  };
})
