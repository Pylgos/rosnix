{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_sdk";
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "3fdc8d7e69dc0e1a68691759419b09cdbe992423";
        hash = "sha256-DZS+JdGCZtuLIkiuJFkHATB/cKCMmk1kbWaHQsI1u1w=";
      };
    };
  });
  meta = {
    description = "\n    This package is wrapping version of ROBOTIS Dynamixel SDK for ROS 2. The ROBOTIS Dynamixel SDK, or SDK, is a software development library that provides Dynamixel control functions for packet communication. The API is designed for Dynamixel actuators and Dynamixel-based platforms.\n  ";
  };
})
