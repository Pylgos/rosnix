{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  ros2cli,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2run = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5f07e2d9f5b281179e66b8db861fae89bec28750";
        hash = "sha256-b47uz+wWc18dLvBagcwf6HiDyCOJMzRparykgHbsYIo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2run";
  version = "0.32.1-1";
  src = sources.ros2run;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest python3Packages.pytest-timeout ];
  missingDependencies = [  ];
  meta = {
    description = "The run command for ROS 2 command line tools.";
  };
}
