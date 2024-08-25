{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    transmission_interface = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "cb3c2e8ff42d149bdfc447252c22e1a681c78924";
        hash = "sha256-PBF9xMGYp2r/SULLIacVp5YRM0/nTZzSJUiUXrc5yco=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "4.16.1-1";
  src = sources.transmission_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "transmission_interface contains data structures for representing mechanical transmissions, methods for propagating values between actuator and joint spaces and tooling to support this.";
  };
}
