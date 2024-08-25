{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  python3Packages,
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
        rev = "53ac43ea38b817cb2de296e52f7f2efd62c6931d";
        hash = "sha256-T/RgrvuvAnmoqwjUWImElXDCW1CgqrAkwRUMP6oIzuY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_geometry_msgs";
  version = "0.38.2-1";
  src = sources.tf2_geometry_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs orocos_kdl_vendor python3Packages.numpy tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_geometry_msgs";
  };
}
