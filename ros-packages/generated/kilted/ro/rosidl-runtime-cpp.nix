{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_cpp";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rosidl-runtime-c ];
  propagatedBuildInputs = [ ament-cmake rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "214901cf7dca17c253c7335acd4dfc82130a32ac";
        hash = "sha256-9h6vUCvEt/vHdz0amPDELoGxlz4LbKbedjFWNIh8Jzg=";
      };
    };
  });
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
})
