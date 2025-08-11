{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-coding,
  etsi-its-conversion,
  etsi-its-msgs,
  etsi-its-msgs-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_messages";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_messages";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_messages" = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "ff2dea3655972e6ce8a610e377c39e072ce316a3";
        hash = "sha256-MWDWLBe0BGohfS1gctVZvKEtRHQJeezEQrgudfTNfyM=";
      };
    };
  });
  meta = {
    description = "ROS support for ETSI ITS messages";
  };
})
