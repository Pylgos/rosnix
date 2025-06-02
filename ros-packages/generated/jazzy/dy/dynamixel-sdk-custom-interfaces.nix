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
  version = "3.8.4-1";
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
        rev = "f7cdf15ea096af814bcafb35da01ca4a5927be2c";
        hash = "sha256-/0zLHjJbu8aT0NnQCxmqgwuSFNiQ599K5eUl1Sube0k=";
      };
    };
  });
  meta = {
    description = "ROS 2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
