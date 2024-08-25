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
        rev = "921bfebbda26dcc7087ea9ef5e7c63219860426b";
        hash = "sha256-N/IJQm5XhIM0dZIVhhYbQG2nBR2KkE6nW41RfIDIxmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_cpp";
  version = "0.33.4-1";
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
