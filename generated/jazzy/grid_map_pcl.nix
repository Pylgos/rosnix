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
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  libyamlcpp,
  pcl,
  rclcpp,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    grid_map_pcl = substituteSource {
      src = fetchgit {
        name = "grid_map_pcl-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5b1b36c2655838e289e1f927ac0a2e5075f5ff93";
        hash = "sha256-6Xmy/TY0qJ7PmIuvbV8JBCMb/1Sr6LteahCV0M51Wuw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_pcl";
  version = "2.2.0-1";
  src = sources.grid_map_pcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros libyamlcpp pcl rclcpp rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Conversions between grid maps and Point Cloud Library (PCL) types.";
  };
}
