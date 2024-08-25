{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  rclcpp_action,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_controller = substituteSource {
      src = fetchgit {
        name = "nav2_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "403351d84d9420f428d60c52ccf52247419afbbd";
        hash = "sha256-QWhwt/vdiW2bhAj6Ev5C0cj+WnrK5woGDzUV9Sk98GY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_controller";
  version = "1.3.1-1";
  src = sources.nav2_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Controller action interface";
  };
}
