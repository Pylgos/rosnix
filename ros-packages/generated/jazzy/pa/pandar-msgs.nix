{
  autoware-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pandar_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."pandar_msgs";
  nativeBuildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "pandar_msgs" = substituteSource {
      src = fetchgit {
        name = "pandar_msgs-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "1e168a005549da1807ec21fdfbe118bfcc2d0889";
        hash = "sha256-DcyDCUgYoOq/FBBX2LjY1hEPJ/DU2zG8x3r2/tCnlvQ=";
      };
    };
  });
  meta = {
    description = "\n    ROS message definition for the Hesai PandarQT/Pandar64/Pandar40P/Pandar20A/Pandar20B/Pandar40M LiDAR\n        sensor.\n  ";
  };
})
