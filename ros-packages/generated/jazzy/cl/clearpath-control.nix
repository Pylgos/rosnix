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
  version = "2.6.4-1";
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
        rev = "5a95cf948fcae5708bf5994e8e0d8e9adefedb6f";
        hash = "sha256-YpTXDM0bIcx0hUt9/uVLGcs4Lc/yJNcXoKL/ppCXn04=";
      };
    };
  });
  meta = {
    description = "Controllers for Clearpath Robotics platforms";
  };
})
