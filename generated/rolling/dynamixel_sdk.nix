{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_sdk = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "81ced5ea6708679a4272c959f76e761b4122f863";
        hash = "sha256-oqGB9nx57Y1CMx1pbn81xSZbN9xXdKhJmj0SvIXyaNY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_sdk";
  version = "3.7.40-5";
  src = sources.dynamixel_sdk;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package is wrapping version of ROBOTIS Dynamixel SDK for ROS 2. The ROBOTIS Dynamixel SDK, or SDK, is a software development library that provides Dynamixel control functions for packet communication. The API is designed for Dynamixel actuators and Dynamixel-based platforms.";
  };
}
