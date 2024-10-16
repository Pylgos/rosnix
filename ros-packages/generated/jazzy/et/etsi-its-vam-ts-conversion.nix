{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-primitives-conversion,
  etsi-its-vam-ts-coding,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "5b37806c9a6be49ddf769f33bc8fa807f3b80fc1";
        hash = "sha256-0UZ8g0f0IcakoBy6MAB2fykKAVpvqdrRbQUMOVgp+HM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_vam_ts_conversion";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS VAMs (TS)";
  };
})
