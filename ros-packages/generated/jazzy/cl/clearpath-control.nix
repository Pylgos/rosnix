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
  version = "2.5.1-1";
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
        rev = "6d2e99fa39a7611a3ef1dadc87220e12fccec338";
        hash = "sha256-I7EFmn9wxwfCtB0AdHS/UyoNv9/EwN23xO16tcCaMjc=";
      };
    };
  });
  meta = {
    description = "Controllers for Clearpath Robotics platforms";
  };
})
