{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cyclonedds,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_binding_c,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rmw_cyclonedds_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_cyclonedds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_cyclonedds-release.git";
        rev = "c77ec9dddb04578bf0d3de4fefcd295aa57ffba5";
        hash = "sha256-eEwV6mToSNQiYEtz+7yZ6KeR7otkBubIYy5jpsgmRwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_cyclonedds_cpp";
  version = "2.2.2-1";
  src = sources.rmw_cyclonedds_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cyclonedds iceoryx_binding_c rcpputils rcutils rmw rmw_dds_common rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Implement the ROS middleware interface using Eclipse CycloneDDS in C++.";
  };
}
