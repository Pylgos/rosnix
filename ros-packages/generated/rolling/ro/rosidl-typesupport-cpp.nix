{
  ament-cmake-core,
  ament-cmake-ros,
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
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rcpputils rcutils rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_cpp" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_cpp-source";
          url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
          rev = "59f9c537ad108522c54f09136b76a8eba3ac152a";
          hash = "sha256-tnLctSk/csqw5TavBsy52puxoT2/DhJml9KIuJygN7I=";
        };
      };
    });
  };
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
