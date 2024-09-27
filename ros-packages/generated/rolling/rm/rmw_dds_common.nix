{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rmw_dds_common" = substituteSource {
      src = fetchgit {
        name = "rmw_dds_common-source";
        url = "https://github.com/ros2-gbp/rmw_dds_common-release.git";
        rev = "0d8414a7bef7cefe58626bbab154cdac9c08570e";
        hash = "sha256-Ziy8rw4/jah4Szi9ELf5T9q2bRgotLCFdsUm8QLrMOk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmw_dds_common";
  version = "3.2.0-1";
  src = sources."rmw_dds_common";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcpputils rcutils rmw rosidl_default_runtime rosidl_runtime_c rosidl_runtime_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common osrf_testing_tools_cpp performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Define a common interface between DDS implementations of ROS middleware.";
  };
}
