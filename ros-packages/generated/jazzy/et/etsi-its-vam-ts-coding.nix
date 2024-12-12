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
  pname = "etsi_its_vam_ts_coding";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "5585a18719e8397612cd99dfc56b4dee5483a57a";
        hash = "sha256-7rJ4ROu9tFiJh/xC84lnJpyd2quSccc4/8nZw+AXlMA=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
