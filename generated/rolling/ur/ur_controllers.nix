{
  ament_cmake,
  angles,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_trajectory_controller,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  rcutils,
  realtime_tools,
  rosSystemPackages,
  std_msgs,
  std_srvs,
  substituteSource,
  ur_dashboard_msgs,
  ur_msgs,
}:
let
  sources = rec {
    ur_controllers-5129ac53e25b6ab3d3f73314eb6c0644206c186f = substituteSource {
      src = fetchgit {
        name = "ur_controllers-5129ac53e25b6ab3d3f73314eb6c0644206c186f-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "5129ac53e25b6ab3d3f73314eb6c0644206c186f";
        hash = "sha256-prONobOmyydNDLHVvl1DNcE6ELVrfWOIMQTirs52LNk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.4.10-1";
  src = sources.ur_controllers-5129ac53e25b6ab3d3f73314eb6c0644206c186f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles controller_interface joint_trajectory_controller lifecycle_msgs pluginlib rclcpp_lifecycle rcutils realtime_tools std_msgs std_srvs ur_dashboard_msgs ur_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
}
