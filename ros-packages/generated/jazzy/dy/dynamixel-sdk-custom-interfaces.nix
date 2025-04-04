{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_sdk_custom_interfaces";
  version = "3.8.2-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk_custom_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk_custom_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_custom_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "10e4c2ba74022bfd0c65013fff60b11365715e35";
        hash = "sha256-8MRDkb0X5TZnm3VdoBdl1VNiQJ/snMGTmHAv4jbj280=";
      };
    };
  });
  meta = {
    description = "ROS 2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
