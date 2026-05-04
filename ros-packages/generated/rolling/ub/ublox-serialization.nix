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
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."ublox_serialization";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_serialization" = substituteSource {
      src = fetchgit {
        name = "ublox_serialization-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "07d7bf5bdc8bb83f0d80dd8cb2374e4b7f981aa2";
        hash = "sha256-gNH4L8UR3sKJtrrpn2N1gJIkUW+Vk9Feq1WysReGKgQ=";
      };
    };
  });
  meta = {
    description = "\n\n     ublox_serialization provides header files for serialization of ROS messages to and from u-blox message format.\n\n  ";
  };
})
