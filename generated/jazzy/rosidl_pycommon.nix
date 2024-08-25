{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_pycommon = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f13376be46a3ff8db06c6e8ac04371c9f02bce13";
        hash = "sha256-pz2N7wj/tWNBN+Zhjeaoj0eAWJLvOAu91LZmpw0RWfg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.6.3-1";
  src = sources.rosidl_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
}
