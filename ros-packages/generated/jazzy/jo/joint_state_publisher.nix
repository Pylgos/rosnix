{
  ament_copyright,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ros,
  rclpy,
  ros2topic,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    joint_state_publisher-ccdbff6f0f4072ff38800b8cd98649b9403ebc93 = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher-ccdbff6f0f4072ff38800b8cd98649b9403ebc93-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "ccdbff6f0f4072ff38800b8cd98649b9403ebc93";
        hash = "sha256-Nw7THKbjIvXASwE8//Ta0Z1Q5BPXlK5VafC2jZvMs4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_publisher";
  version = "2.4.0-3";
  src = sources.joint_state_publisher-ccdbff6f0f4072ff38800b8cd98649b9403ebc93;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_xmllint launch_testing launch_testing_ros ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "This package contains a tool for setting and publishing joint state values for a given URDF.";
  };
}
