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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-bt-joy controller-manager diff-drive-controller imu-filter-madgwick interactive-marker-twist-server joint-state-broadcaster joint-trajectory-controller joy-linux robot-localization robot-state-publisher teleop-twist-joy twist-mux ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_control" = substituteSource {
      src = fetchgit {
        name = "clearpath_control-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "a5152beefc5342b16cd2e6e7055c223fe44e8e09";
        hash = "sha256-fs71jBIUE878l94VDIJicCFTGAdTukD9htMMw8DorCE=";
      };
    };
  });
  meta = {
    description = "Controllers for Clearpath Robotics platforms";
  };
})
