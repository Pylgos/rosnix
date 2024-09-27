{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcutils,
  rosSystemPackages,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_c-c9f71b76ce2957db0d32271093b471f602806085 = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-c9f71b76ce2957db0d32271093b471f602806085-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c9f71b76ce2957db0d32271093b471f602806085";
        hash = "sha256-LsBMOCV/d7waCHAY7ujB/d/xZgJPHutOM3r+tsECVO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.8.1-1";
  src = sources.rosidl_runtime_c-c9f71b76ce2957db0d32271093b471f602806085;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils rosidl_typesupport_interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
}
