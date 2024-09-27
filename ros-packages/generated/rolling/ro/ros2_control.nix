{
  ament_cmake,
  buildRosPackage,
  controller_interface,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  joint_limits,
  mkSourceSet,
  ros2_control_test_assets,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  transmission_interface,
}:
let
  sources = mkSourceSet (sources: {
    "ros2_control" = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "78c179ee2df734283331252a7ab13ec2a51c5560";
        hash = "sha256-Ehy5rcDHq2jWCrhCs+8tPY9dKivEIcRZdNl0Q0NoErA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros2_control";
  version = "4.17.0-1";
  src = sources."ros2_control";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_interface controller_manager controller_manager_msgs hardware_interface joint_limits ros2_control_test_assets ros2controlcli transmission_interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
}
