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
        rev = "e9738d1d7fa9939313becbed59cae2729a662d77";
        hash = "sha256-2BitDnrOlRMxAJfeVf0gS58CWAfvtzYMQA3rkBRTyW0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.8.1-1";
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
