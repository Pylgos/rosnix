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
        rev = "2ae16ab383a5f5075cd12eaaf87dcb5042cf4ec4";
        hash = "sha256-lU7XJWV9N/xysn1jQbuMMifrFbmgN+9iQOoUKchczHg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression";
  version = "0.28.0-1";
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
