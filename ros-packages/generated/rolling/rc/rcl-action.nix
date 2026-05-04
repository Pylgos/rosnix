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
  version = "10.4.3-2";
  src = finalAttrs.passthru.sources."rcl_action";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ action-msgs rcl rcutils rmw rosidl-runtime-c ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ action-msgs rcl rcutils rmw rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp rmw-implementation-cmake test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_action" = substituteSource {
      src = fetchgit {
        name = "rcl_action-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "216b5ab29db2478ab165150d34295dd7bfcc7e9f";
        hash = "sha256-+uF9uSrzBqP1+Azf9pLgu+fvf3vCaXhHqEYHFfxetWQ=";
      };
    };
  });
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
})
