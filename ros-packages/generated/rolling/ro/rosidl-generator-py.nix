{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-mypy,
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
  version = "0.26.3-1";
  src = finalAttrs.passthru.sources."rosidl_generator_py";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-mypy ament-cmake-pep257 ament-cmake-uncrustify ament-index-python rmw rosidl-cli rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-typing-extensions" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-mypy ament-cmake-pep257 ament-cmake-uncrustify ament-index-python rmw rosidl-cli rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-typing-extensions" ]; };
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto ament-lint-common rmw rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-typesupport-c rosidl-typesupport-fastrtps-c rosidl-typesupport-introspection-c rpyutils test-interface-files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "9f322ff609f586e61e11195cb7dcdf78f7f4fb9e";
        hash = "sha256-DPkJeIr8/1yHPYPsfU48HmmrQSn5NVnJ9qfGiG8gcPE=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
})
