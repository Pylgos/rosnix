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
  version = "2.0.0-1";
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
        rev = "7f724b0c8f58f99abbeecf4553e7da6e06d9b413";
        hash = "sha256-2CK3pt/HO1n2okrjkQefoTw3SFKei6+EHrfJxOpVk7E=";
      };
    };
  });
  meta = {
    description = "Packages for working with Clearpath Platforms from a ROS 2 desktop.";
  };
})
