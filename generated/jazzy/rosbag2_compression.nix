{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  rcutils,
  rosbag2_cpp,
  rosbag2_storage,
  rosbag2_test_common,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_compression = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e9f02784260049a13a59f732a6fa929e9fb95880";
        hash = "sha256-8nlnW5g1RTYkA+ArxXZrXOdbjHbgAQQP93gtEWnDQrM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression";
  version = "0.26.4-1";
  src = sources.rosbag2_compression;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2_cpp rosbag2_storage ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rclcpp rosbag2_test_common test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
}
