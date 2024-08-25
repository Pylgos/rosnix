{
  ament_copyright,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2topic,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    joint_state_publisher = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "95191ef225b7c3c295aea1921f32752c95f58d19";
        hash = "sha256-Nw7THKbjIvXASwE8//Ta0Z1Q5BPXlK5VafC2jZvMs4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_publisher";
  version = "2.4.0-2";
  src = sources.joint_state_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_xmllint launch_testing launch_testing_ros python3Packages.pytest ros2topic ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a tool for setting and publishing joint state values for a given URDF.";
  };
}
