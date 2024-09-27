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
  rosSystemPackages,
  rosidl_cli,
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_dds_idl-6a982f6a23613fc9e11e8ecba8e801572e086db4 = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-6a982f6a23613fc9e11e8ecba8e801572e086db4-source";
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
  src = sources.rosidl_generator_dds_idl-6a982f6a23613fc9e11e8ecba8e801572e086db4;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake rosidl_cli rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
}
