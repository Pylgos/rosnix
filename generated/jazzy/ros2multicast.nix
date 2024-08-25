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
  substituteSource,
}:
let
  sources = rec {
    ros2multicast = substituteSource {
      src = fetchgit {
        name = "ros2multicast-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ce0d5651fc2f7216e8e13e5ffb1aa81ab01ad85c";
        hash = "sha256-No/jcpN7VYZg24B6jWpMh+aDTeAA4CUjIW7Gu1NgRes=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2multicast";
  version = "0.32.1-1";
  src = sources.ros2multicast;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest python3Packages.pytest-timeout ];
  missingDependencies = [  ];
  meta = {
    description = "The multicast command for ROS 2 command line tools.";
  };
}
