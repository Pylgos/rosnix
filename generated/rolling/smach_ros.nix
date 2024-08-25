{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  smach,
  smach_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    smach_ros = substituteSource {
      src = fetchgit {
        name = "smach_ros-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "23d7dc669c66f97f9721a03605f9f06e079b6b15";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach_ros";
  version = "3.0.3-2";
  src = sources.smach_ros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy smach smach_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS. For example, SMACH-ROS can call ROS services, listen to ROS topics, and integrate with";
  };
}
