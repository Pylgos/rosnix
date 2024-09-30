{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "grid_map_cv" = substituteSource {
      src = fetchgit {
        name = "grid_map_cv-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6504315ac27f69868585f914363ea1a1f345f250";
        hash = "sha256-Lp09fVPR5XQQzOBAN+e2yIboOKRcMBV7vLPniPun+LA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "grid_map_cv";
  version = "2.2.0-1";
  src = sources."grid_map_cv";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge filters grid-map-cmake-helpers grid-map-core pluginlib rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversions between grid maps and OpenCV images.";
  };
}
