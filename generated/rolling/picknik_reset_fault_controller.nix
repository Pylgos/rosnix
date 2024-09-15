{
  ament_cmake_ros,
  buildRosPackage,
  controller_interface,
  example_interfaces,
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
      src = fetchgit {
        name = "picknik_reset_fault_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "6d183a64ea14c307bcb39906198b8a926664cf60";
        hash = "sha256-1YeT/ItbimfyeiruRaU6K0IcXsIuJworLhzpN4VczDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_reset_fault_controller";
  version = "0.0.3-2";
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
