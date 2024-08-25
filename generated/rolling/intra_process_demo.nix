{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  opencv,
  rclcpp,
  rmw_implementation_cmake,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    intra_process_demo = substituteSource {
      src = fetchgit {
        name = "intra_process_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e420bc0e875fc896c805e92de58e8a2b5ca01d80";
        hash = "sha256-OzMJX/fXkWvULgBmHV/AvTwlEGdmVRpTsgMyAeT4j3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "intra_process_demo";
  version = "0.34.2-1";
  src = sources.intra_process_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake rmw_implementation_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Demonstrations of intra process communication.";
  };
}
