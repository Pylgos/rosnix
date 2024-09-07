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
        rev = "3b3f992874426701325d7893a55f91f4669585ec";
        hash = "sha256-dWzegj6SxOz5J1AFW25GcsP59v4ywWyvP1k81QL8plg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "14.1.5-1";
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
