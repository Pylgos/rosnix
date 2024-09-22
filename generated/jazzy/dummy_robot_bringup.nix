{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dummy_map_server,
  dummy_sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dummy_robot_bringup = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "ce97419b6cd330a7b4eacf837949c369ee29e0db";
        hash = "sha256-kJh0WAW3P3UPHmVb2h6QmE7cPgws9qZxrLp8+Faol9s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.33.5-1";
  src = sources.dummy_robot_bringup;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python dummy_map_server dummy_sensors launch launch_ros robot_state_publisher ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "dummy robot bringup";
  };
}
