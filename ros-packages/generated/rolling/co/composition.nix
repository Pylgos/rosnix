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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "composition";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."composition";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "composition" = substituteSource {
      src = fetchgit {
        name = "composition-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0e6ab562d74f43ec43f8e049144eb267792ce41c";
        hash = "sha256-/F4W+f33tsrM3L/9RRjSGHwlyyPfhxtFxA4ZvIgw7v0=";
      };
    };
  });
  meta = {
    description = "Examples for composing multiple nodes in a single process.";
  };
})
