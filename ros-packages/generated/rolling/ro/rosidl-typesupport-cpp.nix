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
  version = "3.4.0-1";
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
        rev = "02612793cb410ba098674e8cfdbaf02b566bcc74";
        hash = "sha256-R0+iFHPYKJXW6KwrPkp7aEIWI43VE09Hi8MqdnxSQVc=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
