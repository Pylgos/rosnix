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
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."dynamixel_sdk";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_sdk" = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "04f4e26ee3f9a318a494780c03b2cf0d2b7eb57c";
        hash = "sha256-xhps8XbTxbnFTHNYPQRu527h/tKs78dUBtIV+rNOiFI=";
      };
    };
  });
  meta = {
    description = "\n    This package is wrapping version of ROBOTIS Dynamixel SDK for ROS 2. The ROBOTIS Dynamixel SDK, or SDK, is a software development library that provides Dynamixel control functions for packet communication. The API is designed for Dynamixel actuators and Dynamixel-based platforms.\n  ";
  };
})
