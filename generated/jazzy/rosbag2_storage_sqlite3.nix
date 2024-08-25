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
        rev = "56f0aba97bc331e48e2037da1a11b72cce6e1a8c";
        hash = "sha256-1dfMcvXr36k9SaPUBfVN97ab9rKx9ZCWL24N9Gl0T/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_sqlite3";
  version = "0.26.4-1";
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
