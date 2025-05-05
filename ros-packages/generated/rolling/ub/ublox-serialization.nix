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
  pname = "ublox_serialization";
  version = "2.3.0-3";
  src = finalAttrs.passthru.sources."ublox_serialization";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_serialization" = substituteSource {
      src = fetchgit {
        name = "ublox_serialization-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "591d184ed50d806361cb1d527cc1d48943b06cc7";
        hash = "sha256-b2kP01irILk8Ct0RNRYsczUU7sgdAugMNejSpNFPdGE=";
      };
    };
  });
  meta = {
    description = "\n\n     ublox_serialization provides header files for serialization of ROS messages to and from u-blox message format.\n\n  ";
  };
})
