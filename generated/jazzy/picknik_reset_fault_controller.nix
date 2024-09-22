{
  ament_cmake_ros,
  buildRosPackage,
  controller_interface,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  realtime_tools,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    picknik_reset_fault_controller = substituteSource {
      src = fetchFromGitHub {
        name = "picknik_reset_fault_controller-source";
        owner = "ros2-gbp";
        repo = "picknik_controllers-release";
        rev = "9e3a77bed62ad2d5b25641c7e8347d58db308aca";
        hash = "sha256-1YeT/ItbimfyeiruRaU6K0IcXsIuJworLhzpN4VczDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_reset_fault_controller";
  version = "0.0.3-3";
  src = sources.picknik_reset_fault_controller;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_interface example_interfaces geometry_msgs rclcpp realtime_tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 controller that offers a service to clear faults in a hardware interface";
  };
}
