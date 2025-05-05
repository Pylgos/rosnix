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
  pname = "etsi_its_mapem_ts_coding";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9ef1f9f7e20a4c686fb4cdb71ef4eaf4abfd993b";
        hash = "sha256-JjYt9hMaRt/Fc5ekOsiXvrfNW8qzMoYo5SyF1Xt0ApU=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS MAPEMs (TS) generated from ASN.1 using asn1c";
  };
})
