{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle" = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9bb97dbd428dd5a2369268deac87ac4ef307bdb4";
        hash = "sha256-4rPJq4oUAPrSoE/wDD+FZ7XrqUs9Yu5iA3drltIFQ3U=";
      };
    };
  });
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
