{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  interactive_markers,
  rclcpp,
  substituteSource,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    interactive_marker_twist_server = substituteSource {
      src = fetchgit {
        name = "interactive_marker_twist_server-source";
        url = "https://github.com/ros2-gbp/interactive_marker_twist_server-release.git";
        rev = "ebbcfde78840e10069a8c7d8c7c8255dcd8668a7";
        hash = "sha256-FvPQhN5z6jkYZtScraxOUe3bjI3cA495ni/sp/Hh7uk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_marker_twist_server";
  version = "2.1.0-3";
  src = sources.interactive_marker_twist_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs interactive_markers rclcpp tf2 visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interactive control for generic Twist-based robots using interactive markers";
  };
}
