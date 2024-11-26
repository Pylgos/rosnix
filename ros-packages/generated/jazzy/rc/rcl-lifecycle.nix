{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_lifecycle";
  version = "9.2.4-1";
  src = finalAttrs.passthru.sources."rcl_lifecycle";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl rcutils rmw rosidl-runtime-c tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_lifecycle" = substituteSource {
        src = fetchgit {
          name = "rcl_lifecycle-source";
          url = "https://github.com/ros2-gbp/rcl-release.git";
          rev = "8cb8586b19d57cd069ab404e5d6da720b3eba370";
          hash = "sha256-8tST8DBg7YREQrVCiCyV79R/z1VOpOu2V0o6RsTCoxc=";
        };
      };
    });
  };
  meta = {
    description = "Package containing a C-based lifecycle implementation";
  };
})
