{
  ament_cmake_core,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick_vendor,
  mkSourceSet,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "b1dd2700766bf04b5de9000d103ce04c428d9eff";
        hash = "sha256-vft5tFLJmmiYrtClboG9qxWq5rhW3YXgCBwCXfmi63Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_typesupport_c";
  version = "3.3.1-1";
  src = sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cli rosidl_generator_c rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rcpputils rcutils rosidl_runtime_c rosidl_typesupport_fastrtps_c rosidl_typesupport_interface rosidl_typesupport_introspection_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common mimick_vendor performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the type support for C messages.";
  };
}
