{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "1ba0e182ee66f78df17fddcd7e900de03b1d861a";
        hash = "sha256-2enrBsqpBumagHtj18pRaIpLpap5s2mvCe4IdyK+ooQ=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publisher nodes";
  };
})
