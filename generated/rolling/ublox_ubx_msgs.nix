{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ublox_ubx_msgs = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_msgs-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "36e6296bc35b94c9026f69460103b362c00a6e1c";
        hash = "sha256-ERggcaG4kBM5GwH5iM+42CzraKbcqjGc1IMqgeoBtrE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_ubx_msgs";
  version = "0.5.3-1";
  src = sources.ublox_ubx_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "UBLOX UBX ROS2 Msgs";
  };
}
