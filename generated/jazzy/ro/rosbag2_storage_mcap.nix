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
    rosbag2_storage_mcap-b5c88ecb4a741c44d467d791b76beabe13646055 = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-b5c88ecb4a741c44d467d791b76beabe13646055-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b5c88ecb4a741c44d467d791b76beabe13646055";
        hash = "sha256-LDI62PpmzQh2d5/irOMb87UNPlUY6GCqT2cDjTisKIc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap";
  version = "0.26.5-1";
  src = sources.rosbag2_storage_mcap-b5c88ecb4a741c44d467d791b76beabe13646055;
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
