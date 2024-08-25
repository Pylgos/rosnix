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
        rev = "da4325e20b63abe10d31a680bf13d280ec0d60f6";
        hash = "sha256-lrxK02JQAQ38K8axouT1Ux88D2edBaNj4Lu0aTrqNio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2multicast";
  version = "0.34.1-1";
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
