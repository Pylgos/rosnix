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
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.19.6-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_multithreaded_executor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_multithreaded_executor" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_multithreaded_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7438735b3551894c0a9bb1ae674500e5e536c47d";
        hash = "sha256-Pp86TKSxcGYAzOeoIXT9zGz9ecwPvKBfmgbI39yccus=";
      };
    };
  });
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
