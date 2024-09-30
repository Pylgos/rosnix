{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-traffic,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_visualization_navgraphs" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_navgraphs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "5d7847890ceeea5f3168973690211db71127ef37";
        hash = "sha256-/MJqArAa3rNM1IItwqwfCYIiEZx1nsXBMQf9lMLLXb0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_visualization_navgraphs";
  version = "2.3.2-1";
  src = sources."rmf_visualization_navgraphs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-fleet-msgs rmf-traffic rmf-traffic-ros2 rmf-visualization-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to visualiize the navigation graphs of fleets";
  };
}
