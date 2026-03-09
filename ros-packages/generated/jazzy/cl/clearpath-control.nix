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
  version = "2.9.3-1";
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
        rev = "26d43501beb68b35ff7b52b92db34e092f4f8483";
        hash = "sha256-POMmO11t8sGR5uxR1nXU+cm98vKbnP88lg8TuTh4haA=";
      };
    };
  });
  meta = {
    description = "Controllers for Clearpath Robotics platforms";
  };
})
