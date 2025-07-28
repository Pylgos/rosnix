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
  version = "7.0.1-1";
  src = finalAttrs.passthru.sources."rcutils";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcutils" = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "e4e015424d6f0f8fd0fcc02ff0585206909b2199";
        hash = "sha256-mdYlTjmRrjFQlKyiKnlTM6+0AZ2stj7nPFM7yLHI+Ws=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for C";
  };
})
