{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  rosbag2_cpp,
  rosbag2_transport,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_cpp = substituteSource {
      src = fetchFromGitHub {
        name = "rosbag2_examples_cpp-source";
        owner = "ros2-gbp";
        repo = "rosbag2-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp rosbag2_cpp rosbag2_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
}
