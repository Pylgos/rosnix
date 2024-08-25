{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  domain_coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    ros2test = substituteSource {
      src = fetchgit {
        name = "ros2test-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "87f9361b131712dfb1e3b7e342eb8f293fd919df";
        hash = "sha256-tqKhYA9+IzjW93SioL3LjEtOGETxMpk409QC1KJF5w4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2test";
  version = "0.6.0-3";
  src = sources.ros2test;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ domain_coordinator ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch launch_ros launch_testing launch_testing_ros ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The test command for ROS 2 launch tests.";
  };
}
