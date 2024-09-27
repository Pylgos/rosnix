{
  ament_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  twist_mux_msgs,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "twist_mux" = substituteSource {
      src = fetchgit {
        name = "twist_mux-source";
        url = "https://github.com/ros2-gbp/twist_mux-release.git";
        rev = "025308b135ade9fed08cd4b41ec8148cfbf95f08";
        hash = "sha256-1U2LplwpCgA8qKz24xmFg4QH73v52isEVKL9Xck6OlA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "twist_mux";
  version = "4.3.0-3";
  src = sources."twist_mux";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_updater geometry_msgs rclcpp std_msgs twist_mux_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ament_lint_common launch launch_testing launch_testing_ament_cmake launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Twist multiplexer, which multiplex several velocity commands (topics) and allows to priorize or disable them (locks).";
  };
}
