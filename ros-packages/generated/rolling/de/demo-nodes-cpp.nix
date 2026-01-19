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
  version = "0.37.5-1";
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
        rev = "dd9d26450ab27e0273444ebd26eaeb312b5c5f70";
        hash = "sha256-/E0q+j7SWGApPdL09lTzq/y1YmkLWuIGRYXJY1Qjke8=";
      };
    };
  });
  meta = {
    description = "\n    C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
