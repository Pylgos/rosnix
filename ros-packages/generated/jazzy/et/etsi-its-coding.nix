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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-coding etsi-its-cam-ts-coding etsi-its-cpm-ts-coding etsi-its-denm-coding etsi-its-denm-ts-coding etsi-its-mapem-ts-coding etsi-its-spatem-ts-coding etsi-its-vam-ts-coding ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-coding etsi-its-cam-ts-coding etsi-its-cpm-ts-coding etsi-its-denm-coding etsi-its-denm-ts-coding etsi-its-mapem-ts-coding etsi-its-spatem-ts-coding etsi-its-vam-ts-coding ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "2765d12bd40896b18eb657581f79f8b3860bd82f";
        hash = "sha256-zmkT+MSAvwEDHesqK0aA4WErPAWuxL3a9hx6X5/LLHo=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS messages generated from ASN.1 using asn1c";
  };
})
