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
        rev = "48cec4c14133a35baed22a947a2a48487f13ee06";
        hash = "sha256-md1r1pU2BDHugOSENoO8Um9K/tJKgazRl80PYKYzQok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_satellite";
  version = "4.1.0-1";
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
