{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_xml,
  launch_yaml,
  python3Packages,
  ros2cli,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2launch = substituteSource {
      src = fetchgit {
        name = "ros2launch-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "4fcbd74e9fe1d7b272ad91b099ae03f394b7774d";
        hash = "sha256-E6Ud3YgAuns/SgPWysda6aIg4WL4tIsihgZwqbOHeVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch";
  version = "0.26.5-2";
  src = sources.ros2launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_ros launch_xml launch_yaml ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The launch command for ROS 2 command line tools.";
  };
}
