{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  smach,
  smach_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    smach_ros = substituteSource {
      src = fetchFromGitHub {
        name = "smach_ros-source";
        owner = "ros2-gbp";
        repo = "executive_smach-release";
        rev = "d16b3bef96ff7b3cac35e8f8ec771f6503498842";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach_ros";
  version = "3.0.3-3";
  src = sources.smach_ros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy smach smach_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS. For example, SMACH-ROS can call ROS services, listen to ROS topics, and integrate with";
  };
}
