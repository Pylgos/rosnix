{
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  sensor_msgs,
  std_msgs,
  substituteSource,
  ublox_serialization,
}:
let
  sources = rec {
    ublox_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "ublox_msgs-source";
        owner = "ros2-gbp";
        repo = "ublox-release";
        rev = "81c2cba3a487d742189f3022efc01fb794ef7034";
        hash = "sha256-y+4Wac/LAoobvoFcSIJ2PGoih6+tPbrMnRKVg6BxUgM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_msgs";
  version = "2.3.0-4";
  src = sources.ublox_msgs;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ sensor_msgs std_msgs ublox_serialization ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ublox_msgs contains raw messages for u-blox GNSS devices.";
  };
}
