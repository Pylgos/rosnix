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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk_custom_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk_custom_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_custom_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "53e0e78fd110b66191b3927feb68881d98b2cf2f";
        hash = "sha256-2VT952dQY4585ftazVd6n2fg2pztfZTZ2KCVJ6V6dhc=";
      };
    };
  });
  meta = {
    description = "ROS 2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
