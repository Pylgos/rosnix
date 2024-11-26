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
  version = "0.17.0-3";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rmw-implementation-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tlsf_cpp" = substituteSource {
        src = fetchgit {
          name = "tlsf_cpp-source";
          url = "https://github.com/ros2-gbp/realtime_support-release.git";
          rev = "8f622c3e255fcd12fc402170b139b3347ef75baf";
          hash = "sha256-cREflSs5wBd1xMcnVyiq5H1VkfQCR1AKoYN2/u4T7nQ=";
        };
      };
    });
  };
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
