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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rcpputils rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "fa83716ecd5a33f9c299778a756e262fb853dc15";
        hash = "sha256-/f6DX5VpuoZbYcgI64tWGpPJPaT5T43+Jaln6c6uHBQ=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
