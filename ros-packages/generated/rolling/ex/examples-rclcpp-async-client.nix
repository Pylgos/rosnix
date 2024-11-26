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
  pname = "examples_rclcpp_async_client";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_async_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_rclcpp_async_client" = substituteSource {
        src = fetchgit {
          name = "examples_rclcpp_async_client-source";
          url = "https://github.com/ros2-gbp/examples-release.git";
          rev = "f38447a2da36e017ea96b98304dbaab7d5efe3e2";
          hash = "sha256-tJnyVRcarjvMgLCg6I/1lzdyn4i1VZ3i2eVLUtP0QpE=";
        };
      };
    });
  };
  meta = {
    description = "Example of an async service client";
  };
})
