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
  version = "3.8.9-1";
  src = finalAttrs.passthru.sources."swri_serial_util";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_serial_util" = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "738dddbb79fdd0eefeacd1f488a830bba95060a3";
        hash = "sha256-MK3gjDeM9BqKUZFANKtCD7vEygw+DqiCht3LqJscdgE=";
      };
    };
  });
  meta = {
    description = "\n    Contains nodes and utilities for serial communication in ROS.\n  ";
  };
})
