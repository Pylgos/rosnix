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
  version = "3.7.40-5";
  src = finalAttrs.passthru.sources."dynamixel_sdk_custom_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dynamixel_sdk_custom_interfaces" = substituteSource {
        src = fetchgit {
          name = "dynamixel_sdk_custom_interfaces-source";
          url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
          rev = "ab4bda85874e8339d298b128d2c9b4632106870a";
          hash = "sha256-pWGzlnONW1lXGAui57EHtKsqI3VguxYMeL+ytq6dgec=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 custom interface examples using ROBOTIS DYNAMIXEL SDK";
  };
})
