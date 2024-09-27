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
  mkSourceSet,
  orocos_kdl_vendor,
  python_cmake_module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "6212e5422373e1c5ec14e74e3ab1786906928261";
        hash = "sha256-+QObzKcNZ9ty7dJGQCLRJxrtxlgCbCr52/ETI6K3cQ0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tf2_geometry_msgs";
  version = "0.36.4-1";
  src = sources."tf2_geometry_msgs";
  nativeBuildInputs = [ ament_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "tf2_geometry_msgs";
  };
}
