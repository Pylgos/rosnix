{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "84d42627d8f35c15bb11f61070df6bb40c765437";
        hash = "sha256-JYQdDaWy22I59kIutGPNFZuWoBjXs3ixSe7c/nFr5m8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_cpp";
  version = "0.28.0-1";
  src = sources.rosbag2_examples_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rosbag2_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
}
