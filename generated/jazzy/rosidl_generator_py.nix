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
    rosidl_generator_py = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "8220427f3d3a26be945adc0a3291127a9b4a8f82";
        hash = "sha256-oe7q6zEijgXySpyRe+qMBw/0JkOggcPLAPf1XvbTaO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_py";
  version = "0.22.0-2";
  src = sources.rosidl_generator_py;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_pep257 ament_cmake_uncrustify python_cmake_module rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_pep257 ament_cmake_uncrustify python_cmake_module rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ ament_index_python rmw rosidl_runtime_c rosidl_typesupport_c rosidl_typesupport_interface ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_index_python ament_lint_auto ament_lint_common python_cmake_module rmw rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_parser rosidl_typesupport_c rosidl_typesupport_fastrtps_c rosidl_typesupport_introspection_c rpyutils test_interface_files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
}
