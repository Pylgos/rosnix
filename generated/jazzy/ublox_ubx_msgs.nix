{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ublox_ubx_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "ublox_ubx_msgs-source";
        owner = "ros2-gbp";
        repo = "ublox_dgnss-release";
        rev = "ab4207257e0bd9e858866e33b108aa90ba412e5a";
        hash = "sha256-ERggcaG4kBM5GwH5iM+42CzraKbcqjGc1IMqgeoBtrE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_ubx_msgs";
  version = "0.5.3-2";
  src = sources.ublox_ubx_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
}
