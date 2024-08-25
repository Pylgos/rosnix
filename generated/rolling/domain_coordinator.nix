{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    domain_coordinator = substituteSource {
      src = fetchgit {
        name = "domain_coordinator-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "eaf0238fdaa0c604c82921033279c8087e3e128e";
        hash = "sha256-ARFp7X/6YNr9KXLS7vhc5cfrCwaqklD6uxYvkKc3ABQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_coordinator";
  version = "0.13.0-1";
  src = sources.domain_coordinator;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A tool to coordinate unique ROS_DOMAIN_IDs across multiple processes";
  };
}
