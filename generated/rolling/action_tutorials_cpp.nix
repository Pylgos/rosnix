{
  action_tutorials_interfaces,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_cpp = substituteSource {
      src = fetchgit {
        name = "action_tutorials_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "dc37f60c65a8d10c4d2d2dd9a282992b869aaac7";
        hash = "sha256-9VAANthOqS9L0NhIj7lnnkQumALA0KN2GOjMTOehAHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_cpp";
  version = "0.34.2-1";
  src = sources.action_tutorials_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclcpp rclcpp_action rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "C++ action tutorial cpp code";
  };
}
