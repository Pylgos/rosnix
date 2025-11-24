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
  version = "10.2.6-1";
  src = finalAttrs.passthru.sources."rcl_lifecycle";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rcl rcutils rmw rosidl-runtime-c tracetools ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl rcutils rmw rosidl-runtime-c tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rcl_lifecycle-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "1f8073d934f8087b4de2cf67cde2e9c9e96096f0";
        hash = "sha256-FjW4fOk/Wm1KTQpraMeM3BHWJkGjYQC6WQF7hCIkjic=";
      };
    };
  });
  meta = {
    description = "Package containing a C-based lifecycle implementation";
  };
})
