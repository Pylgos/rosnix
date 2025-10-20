{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_primitives_conversion";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_primitives_conversion";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_primitives_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_primitives_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "6f09a6b1f130363bf1f08609456290fc63add813";
        hash = "sha256-UTjmswCwgRomCcJBzRob7/0T6cQdbxK9ak0NFDK1Pog=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
})
