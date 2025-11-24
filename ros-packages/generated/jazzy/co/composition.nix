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
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw-implementation-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "composition";
  version = "0.33.8-1";
  src = finalAttrs.passthru.sources."composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "composition" = substituteSource {
      src = fetchgit {
        name = "composition-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "f953e73528c45c22360c13397f00182ad77da0bf";
        hash = "sha256-5+C1fzBNxMJRmwOY787dqgNJT5DWWavmIwVoePjVjsQ=";
      };
    };
  });
  meta = {
    description = "Examples for composing multiple nodes in a single process.";
  };
})
