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
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "8561f29bf4f89984e43c159a6ab3e46bc5245aa5";
        hash = "sha256-prONobOmyydNDLHVvl1DNcE6ELVrfWOIMQTirs52LNk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ur_controllers";
  version = "2.4.10-1";
  src = sources."ur_controllers";
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
