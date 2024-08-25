{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
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
        rev = "8153158b9309aa6321be81cc5014706d5622c842";
        hash = "sha256-xhR14KbJ/lHazNAYIp19y5GsuRa7eWv0A52n88/WQi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "14.2.5-1";
  src = sources.rviz2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 qt5.qtbase rviz_common rviz_default_plugins rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_pytest ament_lint_auto ament_lint_common geometry_msgs python3Packages.pyyaml rclcpp sensor_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "3D visualization tool for ROS.";
  };
}
