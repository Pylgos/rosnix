{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcss3d_agent_msgs,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "df2d12c89346565c8f54bc45259cb0c19d54c820";
        hash = "sha256-U3T+91EoVbYapHoNLcIBJqlUz/YI9BB5jc7jAEpVpZw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent";
  version = "0.4.1-4";
  src = sources.rcss3d_agent;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcss3d_agent_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Launches a RoboCup 3D Simulation Agent, and converts data to and from ROS2 msgs";
  };
}
