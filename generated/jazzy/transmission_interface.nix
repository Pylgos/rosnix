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
        rev = "2a425735fa383f7e17ef1a3564b5664cdae0b99e";
        hash = "sha256-eG6N2IfsLMaGS2Qbkxnh6pYhkE7Vqt8O9Wf5NbqUy3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "4.15.0-1";
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
