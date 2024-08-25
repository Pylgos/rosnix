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
        rev = "372b2ba78d3f9f05464d0eae44947450b4d134ff";
        hash = "sha256-XmVTFLkZLH/YYcUJVrJB5EKTSzKxyqPw3n+VOakTBH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch";
  version = "0.27.2-1";
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
