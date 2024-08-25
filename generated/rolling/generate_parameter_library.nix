{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  generate_parameter_library_py,
  parameter_traits,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  rsl,
  substituteSource,
  tcb_span,
  tl_expected,
}:
let
  sources = rec {
    generate_parameter_library = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "380ed9e0a0282e8bfc90367bbf20657902646799";
        hash = "sha256-3/xDuucYQUArz1x/C9LSjpYpCEX8i3QuApT+wUhylr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_library";
  version = "0.3.8-3";
  src = sources.generate_parameter_library;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ generate_parameter_library_py ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt parameter_traits rclcpp rclcpp_lifecycle rclpy rsl tcb_span tl_expected ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
}
