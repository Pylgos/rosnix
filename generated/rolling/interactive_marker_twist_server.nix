{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  interactive_markers,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    interactive_marker_twist_server = substituteSource {
      src = fetchFromGitHub {
        name = "interactive_marker_twist_server-source";
        owner = "ros2-gbp";
        repo = "interactive_marker_twist_server-release";
        rev = "a614494c6cd56baf9e33e1f965c91cab37f76cb9";
        hash = "sha256-FvPQhN5z6jkYZtScraxOUe3bjI3cA495ni/sp/Hh7uk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_marker_twist_server";
  version = "2.1.0-2";
  src = sources.interactive_marker_twist_server;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs interactive_markers rclcpp tf2 visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interactive control for generic Twist-based robots using interactive markers";
  };
}
