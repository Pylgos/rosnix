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
  pname = "swri_serial_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_serial_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_serial_util" = substituteSource {
        src = fetchgit {
          name = "swri_serial_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "59d5646ed755e43207b6119a84ade33efc78c083";
          hash = "sha256-fdAVUHVW5fr7Jpea4eONbvZcz+z9UbBwr9X0w0Un2LA=";
        };
      };
    });
  };
  meta = {
    description = "Contains nodes and utilities for serial communication in ROS.";
  };
})
