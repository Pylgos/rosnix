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
  version = "1.0.0-1";
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
        rev = "30ddd5939c03df671764839d20b0ee7dd72647d3";
        hash = "sha256-XaZIbtdY4v5MIvg+WoFxJrGvGRrOHkettCZBuY5iRfk=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
