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
        rev = "af4b8d01d7b62ded8040ff8afae03002315bbb8d";
        hash = "sha256-Z4Dh1i3c0uVgC1INpsOPZg2x7yS3rTm9i9j2RUq3UDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "4.8.1-1";
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
