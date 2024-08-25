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
        rev = "eda7cdd2e734ba7ff520c48bf8291958b8bffca7";
        hash = "sha256-/+MNP4GbanNjSgzwqKWApgBdxqJqX+hlOjbUyiYYcbg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "4.16.0-1";
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
