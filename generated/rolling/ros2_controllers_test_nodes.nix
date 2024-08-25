{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    ros2_controllers_test_nodes = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "0c3cb1ba122b9f731ce7df99d11d35e79bcadd29";
        hash = "sha256-5LaRRY7OQ/AmgvKcoA3UweqhDfHfJPVuF7IG/9SD2Rg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "4.13.0-1";
  src = sources.ros2_controllers_test_nodes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Demo nodes for showing and testing functionalities of the ros2_control framework.";
  };
}
