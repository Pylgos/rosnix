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
  rosbag2_transport,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "9c37e6487f7542054f6d06239bcb31f28c2bacd4";
        hash = "sha256-lslBvo95xI28KhaVKOKNumO7yNCsoJVwrlXG56HXbAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_cpp";
  version = "0.29.0-1";
  src = sources.rosbag2_examples_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rosbag2_cpp rosbag2_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
}
