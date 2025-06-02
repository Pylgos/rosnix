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
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."swri_serial_util";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_serial_util" = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "afcf1e092ec7eaf98b661ae439f48bc10b6c1340";
        hash = "sha256-Z3dwaV/zvJhzoaxgFP2LG3Ah0L2tOQ0zmoFdHyoumpw=";
      };
    };
  });
  meta = {
    description = "\n    Contains nodes and utilities for serial communication in ROS.\n  ";
  };
})
