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
  version = "0.17.1-3";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp ];
  propagatedBuildInputs = [ rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rcpputils rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "ed2397704e66bf1b2d1843e77ab0452691e48d90";
        hash = "sha256-KnCa7u+3fXMm/OluPGca7tXeUfv2f0gSvfp0g8fISW8=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
