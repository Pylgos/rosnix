{
  abseil-cpp,
  ament_cmake,
  buildRosPackage,
  cartographer,
  cartographer_ros,
  cartographer_ros_msgs,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  python3Packages,
  rclcpp,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    cartographer_rviz = substituteSource {
      src = fetchgit {
        name = "cartographer_rviz-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "bbfcf90c36c5c15f560b572c98f886d744b51253";
        hash = "sha256-HBhTH+7iZCDSV9zi8Okp+MFALOAAQc3TV+szBXmIvPU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_rviz";
  version = "2.0.9003-1";
  src = sources.cartographer_rviz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ abseil-cpp cartographer cartographer_ros cartographer_ros_msgs eigen pluginlib python3Packages.boost rclcpp rviz_common rviz_ogre_vendor rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations. This package provides Cartographer's RViz integration.";
  };
}
