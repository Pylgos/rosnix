{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cpm-ts-coding,
  etsi-its-cpm-ts-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cpm_ts_conversion";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cpm-ts-coding etsi-its-cpm-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "b1ccc5bcb01337741b3e5c20ab040cc5a5dce7a9";
        hash = "sha256-7erUSLIgaQcE7LNemNxGRHiZIjk49jJF1D0WieggVpA=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CPMs (TS)";
  };
})
