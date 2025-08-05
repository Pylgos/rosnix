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
  rcpputils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tlsf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tlsf_cpp";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp rmw std-msgs tlsf ];
  propagatedBuildInputs = [ ament-cmake rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rcpputils rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "bba37b36137d31b0787cabf3a76ff51766c4136e";
        hash = "sha256-PgdTELhoG7aEPC900GsiPIQ+3seSyAI2aJaIhWGabVc=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
