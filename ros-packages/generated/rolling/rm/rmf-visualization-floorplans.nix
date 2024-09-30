{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rmf-building-map-msgs,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_visualization_floorplans" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_floorplans-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "f5db5d7c7aefab0558adc27f85c26317b2c6a9b5";
        hash = "sha256-h7XVWFNOGkW7n/Hl3mNY49cX8M1WstyBA0c3fbA4mJo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_visualization_floorplans";
  version = "2.4.0-1";
  src = sources."rmf_visualization_floorplans";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rmf-building-map-msgs rmf-visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package to visualize the floorplans for levels in a building";
  };
}
