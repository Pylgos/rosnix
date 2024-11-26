{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
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
  version = "6.9.3-1";
  src = finalAttrs.passthru.sources."rcutils";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcutils" = substituteSource {
        src = fetchgit {
          name = "rcutils-source";
          url = "https://github.com/ros2-gbp/rcutils-release.git";
          rev = "b7ff3495da7b27ac108abf61b250fb15476f86a9";
          hash = "sha256-xXjzw2KzrhgVVtLHqKsID5I3JERFjVrkbW7lq+a9C6w=";
        };
      };
    });
  };
  meta = {
    description = "Package containing various utility types and functions for C";
  };
})
