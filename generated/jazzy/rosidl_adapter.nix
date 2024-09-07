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
        rev = "5f5c3d207e17c5befad6f0ae71c1ea3d5c2cd8ac";
        hash = "sha256-elXi9n8QLHGPkNHcl9bXppCPla0/ZJQdBPqH+nIXNGU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "4.6.4-1";
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
