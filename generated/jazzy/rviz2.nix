{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3,
  python3Packages,
  qt5,
  rclcpp,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz2 = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "d889776e786e3f2f1043e1031dd9cdedc94ce124";
        hash = "sha256-f7iDZnRpaqulZ+ZCpYInc37uyUyKQBUN9A28vK/C9dA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "14.1.4-1";
  src = sources.rviz2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 qt5.qtbase rviz_common rviz_default_plugins rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_pytest ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto geometry_msgs python3Packages.pyyaml rclcpp sensor_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "3D visualization tool for ROS.";
  };
}
