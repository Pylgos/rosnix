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
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_minimal_subscriber";
  version = "0.19.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_subscriber";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_minimal_subscriber" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_minimal_subscriber-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "51085a7cdc7e60d40c5f523e193748e79d1b9dba";
          hash = "sha256-tu9OkbPYxmWgDYDJhYrmvkDUtuBr4uK5El2ZvTgnb8k=";
        };
      };
    });
  };
  meta = {
    description = "Examples of minimal subscribers";
  };
})
