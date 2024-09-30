{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  dummy-map-server,
  dummy-sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dummy_robot_bringup" = substituteSource {
      src = fetchgit {
        name = "dummy_robot_bringup-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "ce97419b6cd330a7b4eacf837949c369ee29e0db";
        hash = "sha256-kJh0WAW3P3UPHmVb2h6QmE7cPgws9qZxrLp8+Faol9s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dummy_robot_bringup";
  version = "0.33.5-1";
  src = sources."dummy_robot_bringup";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python dummy-map-server dummy-sensors launch launch-ros robot-state-publisher ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "dummy robot bringup";
  };
}
