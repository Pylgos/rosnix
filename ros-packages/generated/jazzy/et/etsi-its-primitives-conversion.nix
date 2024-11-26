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
  pname = "etsi_its_primitives_conversion";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_primitives_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_primitives_conversion" = substituteSource {
        src = fetchgit {
          name = "etsi_its_primitives_conversion-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "52378caeac5785a71d240d40fcf2753b5f807fd3";
          hash = "sha256-3ZwlPcYJzClL8SmuPX2ckSCQ0Vj/+ByE7EzL9WEIvYQ=";
        };
      };
    });
  };
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
})
