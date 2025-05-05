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
  version = "3.8.3-1";
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
        rev = "564d046f62d9d339d5a07ed5d557866924912f6e";
        hash = "sha256-8reLqchYUJWMD6KTAS1NXgXpGiP4jodlde7Se3HWdsM=";
      };
    };
  });
  meta = {
    description = "ROS 2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
