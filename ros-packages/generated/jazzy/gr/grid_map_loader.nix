{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_msgs,
  grid_map_ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "grid_map_loader" = substituteSource {
      src = fetchgit {
        name = "grid_map_loader-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "4501f5bc538250bd4dc4b016ba952b05b243039f";
        hash = "sha256-Qd1RNyDd206Vr7IV8iIlm6BUxM+U3emoWQlVg2YEPBg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "grid_map_loader";
  version = "2.2.0-1";
  src = sources."grid_map_loader";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Loading and publishing grid maps from bag files.";
  };
}