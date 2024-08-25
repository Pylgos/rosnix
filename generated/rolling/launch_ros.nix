{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle_msgs,
  osrf_pycommon,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    launch_ros = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "80640e6394ae66a05d6fbe44ec3d06b2427ca037";
        hash = "sha256-0WnYve+wHC5hnSgtfmrjeMkl0t9ty5QnblgkvXrU5Do=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_ros";
  version = "0.27.2-1";
  src = sources.launch_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python composition_interfaces launch lifecycle_msgs osrf_pycommon rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
}
