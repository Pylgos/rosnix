{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_pep257,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rmw,
  rosSystemPackages,
  rosidl_cli,
  rosidl_cmake,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_c,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  rpyutils,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    rosidl_generator_py-535bc7f637a110cd1ddc725b1ca2f81b0e649f11 = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-535bc7f637a110cd1ddc725b1ca2f81b0e649f11-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "535bc7f637a110cd1ddc725b1ca2f81b0e649f11";
        hash = "sha256-41P+aG+YcVxjNKVoaa73NS0XiYb2odma/GwelgSySs0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_py";
  version = "0.23.1-1";
  src = sources.rosidl_generator_py-535bc7f637a110cd1ddc725b1ca2f81b0e649f11;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_pep257 ament_cmake_uncrustify python_cmake_module rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rmw rosidl_runtime_c rosidl_typesupport_c rosidl_typesupport_interface rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_index_python ament_lint_auto ament_lint_common python_cmake_module rmw rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_parser rosidl_typesupport_c rosidl_typesupport_fastrtps_c rosidl_typesupport_introspection_c rpyutils test_interface_files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
}
