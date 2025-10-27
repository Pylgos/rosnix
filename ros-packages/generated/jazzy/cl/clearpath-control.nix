{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-bt-joy,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-filter-madgwick,
  interactive-marker-twist-server,
  joint-state-broadcaster,
  joint-trajectory-controller,
  joy-linux,
  mecanum-drive-controller,
  mkSourceSet,
  robot-localization,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  teleop-twist-joy,
  twist-mux,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_control";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."clearpath_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clearpath-bt-joy controller-manager diff-drive-controller imu-filter-madgwick interactive-marker-twist-server joint-state-broadcaster joint-trajectory-controller joy-linux mecanum-drive-controller robot-localization robot-state-publisher teleop-twist-joy twist-mux ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-bt-joy controller-manager diff-drive-controller imu-filter-madgwick interactive-marker-twist-server joint-state-broadcaster joint-trajectory-controller joy-linux mecanum-drive-controller robot-localization robot-state-publisher teleop-twist-joy twist-mux ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_control" = substituteSource {
      src = fetchgit {
        name = "clearpath_control-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "810553051257532e7604ac5c9fcca5cf1282736d";
        hash = "sha256-9Lt3dAuJLvD/Hzb+uYTQL3jALyVqxJQdSMKh9XLisWo=";
      };
    };
  });
  meta = {
    description = "Controllers for Clearpath Robotics platforms";
  };
})
