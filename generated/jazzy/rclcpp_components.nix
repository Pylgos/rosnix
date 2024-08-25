{
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rclcpp,
  rcpputils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_components = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "dca0791271f0e50265edb89aca9987deaff140f8";
        hash = "sha256-yaaoRkTV+EOcYi4X2H8EMnfxvQiqgp18u8Bu0TY+cSU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "28.1.3-1";
  src = sources.rclcpp_components;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp class_loader composition_interfaces rclcpp rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_google_benchmark ament_cmake_gtest ament_lint_auto ament_lint_common launch_testing std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
}
