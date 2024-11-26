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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."demo_nodes_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros launch-xml rcl rcl-interfaces rclcpp rclcpp-components rcpputils rcutils rmw std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_cpp" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "c9f93f407160f510f72c2c6a2e7660dad7dfe1bb";
        hash = "sha256-RwO0FZlyRWIO7aEBUsS/8aomI1kLYhwKzePSV6D0I00=";
      };
    };
  });
  meta = {
    description = "C++ nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
})
