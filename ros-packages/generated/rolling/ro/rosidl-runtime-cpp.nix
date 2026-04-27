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
  version = "5.2.0-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rosidl-buffer rosidl-runtime-c ];
  propagatedBuildInputs = [ ament-cmake rosidl-buffer rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_runtime_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "61ccc6c4728cc7d2530dbff1df0f324b4c62b93a";
        hash = "sha256-P97tUmzGiKmbp/owvvJJz9JY8eMBMieXu4DxoOcWzys=";
      };
    };
  });
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
})
