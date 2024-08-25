{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fastcdr,
  fastrtps,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rmw_fastrtps_shared_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_shared_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "0e173ceeb37f9fbb0295b3c8fa95391d18dabb06";
        hash = "sha256-adf+3Se8tqfuijOpOkifvbK+bsVN0Lw1yY1GjLm04fU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_fastrtps_shared_cpp";
  version = "8.4.1-1";
  src = sources.rmw_fastrtps_shared_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake fastrtps_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw rmw_dds_common rosidl_dynamic_typesupport rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common osrf_testing_tools_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "Code shared on static and dynamic type support of rmw_fastrtps_cpp.";
  };
}
