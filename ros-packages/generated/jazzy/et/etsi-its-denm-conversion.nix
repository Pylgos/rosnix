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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-denm-coding etsi-its-denm-msgs etsi-its-primitives-conversion ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_denm_conversion" = substituteSource {
        src = fetchgit {
          name = "etsi_its_denm_conversion-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "a6ebc48868153b2fae98df515594926877a8c8db";
          hash = "sha256-Jtf0g2rSBlAWOF7sTSmZqzgq717EcuS7+5nb0CjcKI8=";
        };
      };
    });
  };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs";
  };
})
