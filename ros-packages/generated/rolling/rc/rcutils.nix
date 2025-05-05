{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
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
  version = "6.10.0-1";
  src = finalAttrs.passthru.sources."rcutils";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcutils" = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "952e8790c29f90651619d544055011fcf5dc209d";
        hash = "sha256-UAcD5PTVRc9VGsnhOLSZ3icHq+Z+u0SINfxteqh/Fug=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for C";
  };
})
