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
  rosidl-buffer,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_c";
  version = "5.3.0-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake rcutils rosidl-buffer rosidl-typesupport-interface ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake rcutils rosidl-buffer rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "e1063538d60bdb918964f2192f112d4c10458861";
        hash = "sha256-DPOnqwvQnXnV5Z/i15VjVnpqxeYuwsShAWu4WAv1GdY=";
      };
    };
  });
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
})
