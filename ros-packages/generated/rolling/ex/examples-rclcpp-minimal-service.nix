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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_service";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_service" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "df00e832915168e5d07b02df42f80e14fe79344e";
        hash = "sha256-1mzGN4f0ve4lKcsAO/cGbXEPEGkk0t3n4nrd5d3msqk=";
      };
    };
  });
  meta = {
    description = "A minimal service server which adds two numbers";
  };
})
