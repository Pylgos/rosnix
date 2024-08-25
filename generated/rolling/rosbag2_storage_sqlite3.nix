{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcpputils,
  rcutils,
  rosbag2_storage,
  rosbag2_test_common,
  sqlite3_vendor,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage_sqlite3 = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_sqlite3-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b34c4774ed354a4694a5f641db15e9f2dcdb9635";
        hash = "sha256-bU/dW+kjsui7EO8JbjOZ4AveDZiEhkeL11Nf4wlDyEE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_sqlite3";
  version = "0.28.0-1";
  src = sources.rosbag2_storage_sqlite3;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2_storage sqlite3_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_test_common std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
}
