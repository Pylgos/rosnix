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
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_cpp";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_runtime_cpp" = substituteSource {
        src = fetchgit {
          name = "rosidl_runtime_cpp-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "382e891005674c17a298a4802979d8178cb42864";
          hash = "sha256-u91Lcj98v4nvCJqivsItybePVDguKV4F8zpjWZ/dB1c=";
        };
      };
    });
  };
  meta = {
    description = "Provides definitions and templated functions for getting and working with rosidl typesupport types in C++.";
  };
})
