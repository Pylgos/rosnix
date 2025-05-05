{
  action-msgs,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_action";
  version = "9.2.6-1";
  src = finalAttrs.passthru.sources."rcl_action";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rcl ];
  depsTargetTargetPropagated = [ action-msgs rcutils rmw rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp rmw-implementation-cmake test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_action" = substituteSource {
      src = fetchgit {
        name = "rcl_action-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "f3f523a860b4c37680ae30a560352e7687abd525";
        hash = "sha256-v680SRCcZeKMnnID7rG1P5Eoueq0W1IFt7jv4yRJhXU=";
      };
    };
  });
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
})
