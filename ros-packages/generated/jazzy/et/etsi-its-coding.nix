{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-coding,
  etsi-its-cam-ts-coding,
  etsi-its-cpm-ts-coding,
  etsi-its-denm-coding,
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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-coding etsi-its-cam-ts-coding etsi-its-cpm-ts-coding etsi-its-denm-coding etsi-its-vam-ts-coding ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "76a4ee68dd562f52acc126d0310a87e05d7703f3";
        hash = "sha256-KvlDoZFtMM5ZIgzmBx8EyaNqYhLqFRs1irBNOXsdyto=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS messages generated from ASN.1 using asn1c";
  };
})
