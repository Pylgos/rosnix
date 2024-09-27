{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_generator_py,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_cpp,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_core_runtime-783f3dbf2742ae24cbd2c2a47f305b78eb88a409 = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-783f3dbf2742ae24cbd2c2a47f305b78eb88a409-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "783f3dbf2742ae24cbd2c2a47f305b78eb88a409";
        hash = "sha256-uvmER7BYf4yfHzyfJmwH4OShIzuoeJtaWnFZDsvzePE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_core_runtime";
  version = "0.3.1-1";
  src = sources.rosidl_core_runtime-783f3dbf2742ae24cbd2c2a47f305b78eb88a409;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_generator_py rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A configuration package defining runtime dependencies for core ROS interfaces.";
  };
}
