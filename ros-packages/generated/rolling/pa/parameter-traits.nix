{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  tcb-span,
  tl-expected,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "parameter_traits";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."parameter_traits";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "parameter_traits" = substituteSource {
      src = fetchgit {
        name = "parameter_traits-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "422cc24fb021ca62f1a03751c48b1a9b3e50ba6b";
        hash = "sha256-KEpy4+UMU7wqv9XZcchtjgXVF8g1U6AKylN0q8zNfcE=";
      };
    };
  });
  meta = {
    description = "Functions and types for rclcpp::Parameter";
  };
})
