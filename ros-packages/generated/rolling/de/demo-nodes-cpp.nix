{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  launch-xml,
  mkSourceSet,
  rcl,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "demo_nodes_cpp";
  version = "0.37.1-1";
  src = finalAttrs.passthru.sources."demo_nodes_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros launch-xml rcl rcl-interfaces rclcpp rclcpp-components rcpputils rcutils rmw std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros launch-xml rcl rcl-interfaces rclcpp rclcpp-components rcpputils rcutils rmw std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_cpp" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "63366d5538e959d0f4a0e6928b5dea94b3fcb49e";
        hash = "sha256-nuW7MT7ILPVf6JcTGHFQ6LTq8ZyZqGtEzOiYGm0OWuw=";
      };
    };
  });
  meta = {
    description = "\n    C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
