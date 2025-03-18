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
  version = "3.8.2-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "29d583a1b66c6e24f1f1ea80a7d6a9e684a383d9";
        hash = "sha256-AtxQsODDvRODC72k7BUUEIgK4y3rn+zpA6Wt+I/OxBg=";
      };
    };
  });
  meta = {
    description = "This package is wrapping version of ROBOTIS Dynamixel SDK for ROS 2. The ROBOTIS Dynamixel SDK, or SDK, is a software development library that provides Dynamixel control functions for packet communication. The API is designed for Dynamixel actuators and Dynamixel-based platforms.";
  };
})
