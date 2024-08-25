{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  rclcpp,
  rcpputils,
  rviz_common,
  rviz_default_plugins,
  sensor_msgs,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_satellite = substituteSource {
      src = fetchgit {
        name = "rviz_satellite-source";
        url = "https://github.com/nobleo/rviz_satellite-release.git";
        rev = "6ac71e291cd5d616e2369c91b69abd5b442d3999";
        hash = "sha256-1btiDvrU9NYm/CgsMa3Vwu6Fv4zgHc7A7OhZgKy8MBU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_satellite";
  version = "4.0.0-1";
  src = sources.rviz_satellite;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles qt5.qtbase rclcpp rcpputils rviz_common rviz_default_plugins sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Display satellite map tiles in RViz";
  };
}
