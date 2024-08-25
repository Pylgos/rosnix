{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  python3Packages,
  rosidl_cli,
  substituteSource,
}:
let
  sources = rec {
    rosidl_adapter = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "bfccb990ec35e72c560715ef495a7048a602a35a";
        hash = "sha256-NkvVWsMgN6qrB9/sbgk0gblTWWQb9IaAu+ZVsB+Bgw4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "4.6.3-1";
  src = sources.rosidl_adapter;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_core python3 buildPackages.python3Packages.empy rosidl_cli ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_core python3Packages.empy rosidl_cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "API and scripts to parse .msg/.srv/.action files and convert them to .idl.";
  };
}
