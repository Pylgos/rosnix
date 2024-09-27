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
  rosSystemPackages,
  rosbag2_storage,
  rosbag2_test_common,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage_mcap-6a37ba2418e00603de8db54592977a0497817cf2 = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-6a37ba2418e00603de8db54592977a0497817cf2-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6a37ba2418e00603de8db54592977a0497817cf2";
        hash = "sha256-o3OkhTzf6Kb2LetVZ1UUnAJjGsY+o9Zm6tDc2PcKo98=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap";
  version = "0.29.0-1";
  src = sources.rosbag2_storage_mcap-6a37ba2418e00603de8db54592977a0497817cf2;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp mcap_vendor pluginlib rcutils rosbag2_storage yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_test_common std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
}
