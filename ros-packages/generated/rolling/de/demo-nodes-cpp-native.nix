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
  version = "0.37.3-1";
  src = finalAttrs.passthru.sources."demo_nodes_cpp_native";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rmw-fastrtps-cpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rmw-fastrtps-cpp std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_cpp_native" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "faae7bf18cee0ae15f0fca94572cca202ea2f774";
        hash = "sha256-4jeixv0PU9YSQ8fih2yLNTypfy6Kelzwk2TFKfhgnhw=";
      };
    };
  });
  meta = {
    description = "\n    C++ nodes which access the native handles of the rmw implementation.\n  ";
  };
})
