{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
  rclcpp,
  rcutils,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_visual_testing_framework = substituteSource {
      src = fetchgit {
        name = "rviz_visual_testing_framework-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "837b6b36b1d3a33f4c7f30871b8959a4830badf4";
        hash = "sha256-UARA+XxfHLus05+rcJ4X4R/RgnKa36cWace85ZSgu0Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_visual_testing_framework";
  version = "14.2.5-1";
  src = sources.rviz_visual_testing_framework;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs qt5.qtbase rclcpp rcutils rviz_common rviz_ogre_vendor rviz_rendering std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "3D testing framework for RViz.";
  };
}
