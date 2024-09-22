{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rosSystemPackages,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "382e891005674c17a298a4802979d8178cb42864";
        hash = "sha256-u91Lcj98v4nvCJqivsItybePVDguKV4F8zpjWZ/dB1c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_cpp";
  version = "4.6.4-1";
  src = sources.rosidl_runtime_cpp;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
}
