{
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  urdfdom,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_description = substituteSource {
      src = fetchgit {
        name = "ur_description-source";
        url = "https://github.com/ros2-gbp/ur_description-release.git";
        rev = "f3815ee0344981c295f5c69d652af616973aba45";
        hash = "sha256-MciglJIJgs8rQqg5m/Vo3+LIwiJ8BFF7Va1cUbthaZU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_description";
  version = "2.4.2-1";
  src = sources.ur_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest launch_testing_ament_cmake launch_testing_ros urdfdom xacro ];
  missingDependencies = [  ];
  meta = {
    description = "URDF description for Universal Robots";
  };
}
