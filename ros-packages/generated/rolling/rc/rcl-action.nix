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
  version = "10.0.1-1";
  src = finalAttrs.passthru.sources."rcl_action";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs rcl rcutils rmw rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp rmw-implementation-cmake test-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_action" = substituteSource {
        src = fetchgit {
          name = "rcl_action-source";
          url = "https://github.com/ros2-gbp/rcl-release.git";
          rev = "2175c9437b72ef62dd5380734da40d77b2856f7c";
          hash = "sha256-VeMQyGt8pXr0Dsys2XWebxMFRWZk3Jfii4nO5E4XahY=";
        };
      };
    });
  };
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
})
