{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcutils,
  rosSystemPackages,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_c";
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake rcutils rosidl-typesupport-interface ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake rcutils rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "7505efe5eeb7e6ead5f4897f18f834e186731602";
        hash = "sha256-X+WQLCqYJQp8pDgp6zl4fV2jghhU2ZLgCVwxbUDMIdQ=";
      };
    };
  });
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
})
