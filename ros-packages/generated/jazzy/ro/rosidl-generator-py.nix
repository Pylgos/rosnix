{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-pep257,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rmw,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-c,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  rpyutils,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_py";
  version = "0.22.0-2";
  src = finalAttrs.passthru.sources."rosidl_generator_py";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-pep257 ament-cmake-uncrustify python-cmake-module rosidl-cli rosidl-generator-c rosidl-parser rosidl-pycommon rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-pep257 ament-cmake-uncrustify python-cmake-module rosidl-cli rosidl-generator-c rosidl-parser rosidl-pycommon rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTargetPropagated = [ ament-index-python rmw rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto ament-lint-common python-cmake-module rmw rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-typesupport-c rosidl-typesupport-fastrtps-c rosidl-typesupport-introspection-c rpyutils test-interface-files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "8220427f3d3a26be945adc0a3291127a9b4a8f82";
        hash = "sha256-oe7q6zEijgXySpyRe+qMBw/0JkOggcPLAPf1XvbTaO8=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
})
