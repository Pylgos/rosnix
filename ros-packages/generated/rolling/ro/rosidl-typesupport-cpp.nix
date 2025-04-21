{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros-core,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-generator-type-description,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-c,
  rosidl-typesupport-fastrtps-cpp,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_cpp";
  version = "3.3.3-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcpputils rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rcutils rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "c2138d784ee7c6c6cd428cafd2ccc972ad2f1883";
        hash = "sha256-AJS+qo5DmJAw6x5Bv9FnwkOB5nnmY6WZ78PBS4Sf51Q=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
