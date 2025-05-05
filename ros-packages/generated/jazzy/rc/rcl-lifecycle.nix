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
  version = "9.2.6-1";
  src = finalAttrs.passthru.sources."rcl_lifecycle";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rcl ];
  depsTargetTargetPropagated = [ lifecycle-msgs rcutils rmw rosidl-runtime-c tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rcl_lifecycle-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "b9e904331d8b146a69601526f2e470a5ca0b1378";
        hash = "sha256-/zrF3BEc7SyMPxfd6mgbOnh74bF8ChNkNgn2BulGGeU=";
      };
    };
  });
  meta = {
    description = "Package containing a C-based lifecycle implementation";
  };
})
