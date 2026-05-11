{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  mimick-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  performance-test-fixture,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcutils";
  version = "7.2.0-1";
  src = finalAttrs.passthru.sources."rcutils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcutils" = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "a4e5cd8c204f0d899f3469ea42c5f0216552ea8f";
        hash = "sha256-wM0CgBDuHgna+COY2tMsgu18BmhwqJf6jYxnQbEy4eQ=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for C";
  };
})
