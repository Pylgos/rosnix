{
  ament_cmake,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_kdl,
  trac_ik_lib,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    trac_ik_kinematics_plugin = substituteSource {
      src = fetchgit {
        name = "trac_ik_kinematics_plugin-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "24bf5772c012f78fdf75894cda26c296f9dda8d5";
        hash = "sha256-Xj4omXPV8GY+CWCUvSBOT33WTxVQiW0A8N57S5bpDNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trac_ik_kinematics_plugin";
  version = "2.0.1-1";
  src = sources.trac_ik_kinematics_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader generate_parameter_library moveit_core pluginlib rclcpp tf2_kdl trac_ik_lib urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A MoveIt! Kinematics plugin using TRAC-IK";
  };
}
