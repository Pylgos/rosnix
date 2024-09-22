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
  rosSystemPackages,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6757855817a91f7d743bb4b491e26c8a124cf720";
        hash = "sha256-CLjALA4Fp9uA8Bsl9XeQxCJtJ5X5k6tHFNnetoIJCSk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_cpp";
  version = "0.26.5-1";
  src = sources.rosbag2_examples_cpp;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp rosbag2_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rosbag2 C++ API tutorials and examples";
  };
}
