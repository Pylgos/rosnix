{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl_parser,
  kinematics_interface,
  mkSourceSet,
  pluginlib,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
  tf2_eigen_kdl,
}:
let
  sources = mkSourceSet (sources: {
    "kinematics_interface_kdl" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "355ba76f768e7c64e57c086fba538d5a7d36cb30";
        hash = "sha256-HTVJf1HOvp/ulI4ThFx2Zk1xyznJeK3pe76vV5sQU8E=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kinematics_interface_kdl";
  version = "1.1.0-1";
  src = sources."kinematics_interface_kdl";
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ kdl_parser kinematics_interface pluginlib tf2_eigen_kdl ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
  };
}
