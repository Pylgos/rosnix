{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  python_cmake_module,
  rclcpp,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_geometry_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "6212e5422373e1c5ec14e74e3ab1786906928261";
        hash = "sha256-+QObzKcNZ9ty7dJGQCLRJxrtxlgCbCr52/ETI6K3cQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_geometry_msgs";
  version = "0.36.4-1";
  src = sources.tf2_geometry_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_geometry_msgs";
  };
}
