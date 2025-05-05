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
  version = "3.2.0-1";
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
        rev = "7caf63e5f0267061c050f7457fe16c88f903d566";
        hash = "sha256-lfy212DZvXJJfpK5wyOOkNXi/MTLy214oq4z8sJW3Sw=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS messages generated from ASN.1 using asn1c";
  };
})
