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
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rosidl-runtime-c ];
  propagatedBuildInputs = [ ament-cmake rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "5813aca5a4a68b3ed46de4f66ca04f8404fabd28";
        hash = "sha256-R73X5v+by7RSBznRkzjsw2ChMk+5vajNCXthrRuAALY=";
      };
    };
  });
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
})
