{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-denm-coding,
  etsi-its-denm-msgs,
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
  pname = "etsi_its_denm_conversion";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-denm-coding etsi-its-denm-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-denm-coding etsi-its-denm-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "39d2a7f06aad36319e14fa9ba0a3ad50545d94a9";
        hash = "sha256-AUCNTsV+0KFwmXE9zRr3A/efItJ8J8t7wjTbwmYkGl0=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs";
  };
})
