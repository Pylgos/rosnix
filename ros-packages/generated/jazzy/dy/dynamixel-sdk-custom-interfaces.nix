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
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk_custom_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk_custom_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_custom_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "2bbcc172075eb30dd4f6b855dbb7bdf5581b47e2";
        hash = "sha256-sTdK+NspDLr2o37sMUEWydVbeSURWCmkANTyCJZPVhI=";
      };
    };
  });
  meta = {
    description = "ROS 2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
