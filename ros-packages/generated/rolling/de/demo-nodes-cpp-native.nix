{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmw-fastrtps-cpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "demo_nodes_cpp_native";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."demo_nodes_cpp_native";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rmw-fastrtps-cpp std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "demo_nodes_cpp_native" = substituteSource {
        src = fetchgit {
          name = "demo_nodes_cpp_native-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "a31bbd4785707dd3bafe443d0e84fa1f91e1672d";
          hash = "sha256-lJTHLWWjYTow3glf/SCVo+Hig4EVFzhRRC+k8GSNK7o=";
        };
      };
    });
  };
  meta = {
    description = "C++ nodes which access the native handles of the rmw implementation.";
  };
})
