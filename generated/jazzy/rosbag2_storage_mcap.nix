{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  pluginlib,
  rcutils,
  rosbag2_storage,
  rosbag2_test_common,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage_mcap = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "374245c946ae8a4e35444ecc54488f017d098afa";
        hash = "sha256-TL6JdnDhtZz2N5HYDO8elpPRSP3QZDfwBpdIlCLOEmo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap";
  version = "0.26.4-1";
  src = sources.rosbag2_storage_mcap;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp mcap_vendor pluginlib rcutils rosbag2_storage yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_test_common std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
}
