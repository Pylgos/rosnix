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
  version = "10.2.2-1";
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
        rev = "4d64c6e2bd73fdfaca9c7c9f97e8bec9b44fc831";
        hash = "sha256-vQrBxQaadMKEJPTPbH1klD//x9BmnpC4lQ9qmo51OsU=";
      };
    };
  });
  meta = {
    description = "Package containing a C-based ROS action implementation";
  };
})
