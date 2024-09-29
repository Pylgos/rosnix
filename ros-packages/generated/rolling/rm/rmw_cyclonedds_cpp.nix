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
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rosSystemPackages,
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  tracetools,
}:
let
  sources = mkSourceSet (sources: {
    "rmw_cyclonedds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_cyclonedds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_cyclonedds-release.git";
        rev = "670c822cdadb2bf8e4da98d7d8ab7b6129ea1492";
        hash = "sha256-eOj4umaDcGlk3wveY/VY/DI3aIGKgjHHr77JRlu90AA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmw_cyclonedds_cpp";
  version = "3.0.2-1";
  src = sources."rmw_cyclonedds_cpp";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cyclonedds iceoryx_binding_c rcpputils rcutils rmw rmw_dds_common rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implement the ROS middleware interface using Eclipse CycloneDDS in C++.";
  };
}