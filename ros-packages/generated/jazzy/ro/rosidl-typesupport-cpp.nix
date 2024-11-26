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
  version = "3.2.2-1";
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
          rev = "f132a4ebc1ac6e5a48413071265c88035f5d9b09";
          hash = "sha256-HxpOKtBoeqyhnYXHJi+nTWIsqh6SVVCDZrKv/rrZ/7A=";
        };
      };
    });
  };
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
