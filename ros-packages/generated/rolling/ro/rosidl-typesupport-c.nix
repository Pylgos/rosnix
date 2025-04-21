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
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_c";
  version = "3.3.3-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcpputils rosidl-cli rosidl-generator-c rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rcutils rosidl-runtime-c rosidl-typesupport-fastrtps-c rosidl-typesupport-interface rosidl-typesupport-introspection-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "f4d4bc69372cb568d7df9a17d36c35e90735bb0a";
        hash = "sha256-eQDlXuEW/AyNNloMQthvbrE2Q0U6w70KGiTbGTEI8YQ=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
