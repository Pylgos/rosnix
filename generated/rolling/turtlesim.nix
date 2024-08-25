{
  ament_cmake,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
  rclcpp,
  rclcpp_action,
  std_msgs,
  std_srvs,
  substituteSource,
  turtlesim_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlesim = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "4fa7d0da6427665fa4540503b0c5bc5cf85314db";
        hash = "sha256-ubEzRIkm0yl5MNSHbJDbWkgXp05T9JMpO2ogZNP4zd8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim";
  version = "1.9.2-1";
  src = sources.turtlesim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp geometry_msgs qt5.qtbase rclcpp rclcpp_action std_msgs std_srvs turtlesim_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "turtlesim is a tool made for teaching ROS and ROS packages.";
  };
}
