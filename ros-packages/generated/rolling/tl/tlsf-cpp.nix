{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl,
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
  version = "0.20.0-2";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcl rclcpp rmw std-msgs tlsf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcl rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common rcpputils rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "28922a8babf4a1cadc84cd16732fb818660878c1";
        hash = "sha256-K/GyKOipF6+a7j89jH6bJLZlDDKTO9872GuuyWv3L6o=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
