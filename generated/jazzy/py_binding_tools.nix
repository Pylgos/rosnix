{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pybind11_vendor,
  rclcpp,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    py_binding_tools = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros-gbp/py_binding_tools-release.git";
        rev = "6bbf5eea730e839c4edc430134463a29759f9a99";
        hash = "sha256-ptJcdfTt1QQXFPCJ4R1QqIIcwEOHo+ay+T7OJqwDAYo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_binding_tools";
  version = "2.0.1-1";
  src = sources.py_binding_tools;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs pybind11_vendor rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common rclpy std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Python binding tools for C++";
  };
}
