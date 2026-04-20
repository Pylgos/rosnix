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
  rosidl-buffer,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_cpp";
  version = "5.1.4-2";
  src = finalAttrs.passthru.sources."rosidl_runtime_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rosidl-buffer rosidl-runtime-c ];
  propagatedBuildInputs = [ ament-cmake rosidl-buffer rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "a9fa58f56debd3e15e44a22c2e11e5ab38456f74";
        hash = "sha256-KZDHG0fT2oFtOKGBGehTIsYBS+5/E4fRrjL/ya0SDd4=";
      };
    };
  });
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
})
