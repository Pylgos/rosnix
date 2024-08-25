{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclcpp,
  sqlite,
  sqlite3_vendor,
  substituteSource,
  warehouse_ros,
}:
let
  sources = rec {
    warehouse_ros_sqlite = substituteSource {
      src = fetchgit {
        name = "warehouse_ros_sqlite-source";
        url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release.git";
        rev = "957a170d2590120ce22fa2abad47d9edbcaea2e3";
        hash = "sha256-t35FEs8tOBkLkg8N637kUzqgjKuUFdixlYei6wCmpMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "warehouse_ros_sqlite";
  version = "1.0.4-1";
  src = sources.warehouse_ros_sqlite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader python3Packages.boost rclcpp sqlite sqlite3_vendor warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_gtest ament_lint_auto ament_lint_common geometry_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of warehouse_ros for sqlite";
  };
}
