{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
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
        rev = "a77b9d9d42fd2b58e596a8edb72fecb0e42deae1";
        hash = "sha256-2kTgsFsgMexLa6Q6iUrd2DF+AyyduvppK02QDEdMijQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_visual_testing_framework";
  version = "14.1.5-1";
  src = sources.rviz_visual_testing_framework;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs qt5.qtbase rclcpp rcutils rviz_common rviz_ogre_vendor rviz_rendering std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_gmock ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "3D testing framework for RViz.";
  };
}
