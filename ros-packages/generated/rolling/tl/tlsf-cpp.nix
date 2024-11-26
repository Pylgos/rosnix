{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tlsf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tlsf_cpp";
  version = "0.18.2-1";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "b49cc08e46118ff5f4ddb2b3d2ec4ea4a4c137b5";
        hash = "sha256-TjeR5rjRzcjyAheMp4EVfNdgOu3res+vsBSi2BKj9gU=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
