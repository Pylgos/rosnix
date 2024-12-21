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
  version = "0.20.4-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_publisher" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "0aacc3ebe3dde5b22fc840337705f0fb69ae804b";
        hash = "sha256-ppJMj66X4z0cb0wgMy5uF/zGQeWbpKBBnogTRdGCIkI=";
      };
    };
  });
  meta = {
    description = "Examples of minimal publisher nodes";
  };
})
