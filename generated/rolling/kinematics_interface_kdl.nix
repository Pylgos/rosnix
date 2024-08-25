{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl_parser,
  kinematics_interface,
  pluginlib,
  ros2_control_test_assets,
  substituteSource,
  tf2_eigen_kdl,
}:
let
  sources = rec {
    kinematics_interface_kdl = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "3d62f0afe792d10697f7b059cec67ae9723921b3";
        hash = "sha256-HTVJf1HOvp/ulI4ThFx2Zk1xyznJeK3pe76vV5sQU8E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface_kdl";
  version = "1.1.0-1";
  src = sources.kinematics_interface_kdl;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen kdl_parser kinematics_interface pluginlib tf2_eigen_kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
}
