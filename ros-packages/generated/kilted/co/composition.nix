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
  version = "0.36.3-1";
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
        rev = "0e51f38a4f9c2a24ddd6599589a254aa1c71132d";
        hash = "sha256-ZmpHrXVlfLyzaRAuCPeSkZGRjIn1KkTd9R1hBXNCQ34=";
      };
    };
  });
  meta = {
    description = "Examples for composing multiple nodes in a single process.";
  };
})
