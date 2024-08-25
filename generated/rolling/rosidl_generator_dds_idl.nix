{
  ament_cmake,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_cli,
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_dds_idl = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "6a982f6a23613fc9e11e8ecba8e801572e086db4";
        hash = "sha256-9NvhSKlCK6YIvPuX1Lp3QZSJ2Wnl+rN0DuNMKvnTH7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_dds_idl";
  version = "0.12.0-1";
  src = sources.rosidl_generator_dds_idl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_cli rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
}
