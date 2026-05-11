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
  pname = "examples_rclcpp_minimal_client";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_minimal_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_minimal_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d4b9931d4751ab5701c8acc0af098c29fc7c7176";
        hash = "sha256-LkEWqNrMYnzA0+vkivvO8LbBcJef+sdoPZsCFx3oQlc=";
      };
    };
  });
  meta = {
    description = "Examples of minimal service clients";
  };
})
