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
        rev = "5e3d0a038b3fb9faa3533271fcecc7c606ad15e5";
        hash = "sha256-pOFTQT4CPWn2FDFTi9cNv54NZ97CMjH/7pOV24uR6Zo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_coordinator";
  version = "0.12.0-3";
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
