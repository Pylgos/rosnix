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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "demo_nodes_cpp";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."demo_nodes_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros launch-xml rcl rcl-interfaces rclcpp rclcpp-components rcpputils rcutils rmw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros launch-xml rcl rcl-interfaces rclcpp rclcpp-components rcpputils rcutils rmw ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_cpp" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "152143cccec4a2fae5e7b4429a3a21a16c39c165";
        hash = "sha256-yFsMvLKZxCdqjMzEuZ+8RU2Ksv7IGRCErQiEqWUuvaY=";
      };
    };
  });
  meta = {
    description = "\n    C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
