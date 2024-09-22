{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  grid_map_core,
  nav2_costmap_2d,
  rosSystemPackages,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    grid_map_costmap_2d = substituteSource {
      src = fetchgit {
        name = "grid_map_costmap_2d-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "65bc27b037f4843e56e43c3e2ef87584e9e73bf2";
        hash = "sha256-n5HVmkLwsGs+vxqRbH+3eiHTsA3bmGXgKQOu+mP04i4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_costmap_2d";
  version = "2.2.0-1";
  src = sources.grid_map_costmap_2d;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs grid_map_cmake_helpers grid_map_core nav2_costmap_2d tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface for grid maps to the costmap_2d format.";
  };
}
