{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-coding,
  etsi-its-cam-ts-coding,
  etsi-its-cpm-ts-coding,
  etsi-its-denm-coding,
  etsi-its-denm-ts-coding,
  etsi-its-mapem-ts-coding,
  etsi-its-spatem-ts-coding,
  etsi-its-vam-ts-coding,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_coding";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-coding etsi-its-cam-ts-coding etsi-its-cpm-ts-coding etsi-its-denm-coding etsi-its-denm-ts-coding etsi-its-mapem-ts-coding etsi-its-spatem-ts-coding etsi-its-vam-ts-coding ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "4a0ada51904178f778a7051ba8b608be094eaac3";
        hash = "sha256-GyRx30jrAuBOdJxEOoBpqUNhw7LUKol5ymaKEwi3QZU=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS messages generated from ASN.1 using asn1c";
  };
})
