{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_service";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "829f48940f94e91f87ce0d013aca5f87b463ae75";
        hash = "sha256-aPqFLO7GyCDw8VxgaMrFth3pdwUvcRY2+B0BLq7tdH0=";
      };
    };
  });
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
