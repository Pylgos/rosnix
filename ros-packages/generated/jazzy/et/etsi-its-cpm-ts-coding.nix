{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cpm_ts_coding";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "20f1a13c4d9be1e7302f1ff8248093f273b33a77";
        hash = "sha256-LH9A+fpt8JbriT3up2EN2/+9lZokHZEO+LUeXYzvtg0=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CPMs (TS) generated from ASN.1 using asn1c";
  };
})
