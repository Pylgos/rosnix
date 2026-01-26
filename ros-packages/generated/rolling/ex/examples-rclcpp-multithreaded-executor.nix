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
  version = "0.21.4-1";
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
        rev = "6ffcb3bca990fc5e1cf85377b7674f17b56540a7";
        hash = "sha256-/8kkipuFkOaqU/mXTTv8BrDtpBawvbCRnAOVIsu5N08=";
      };
    };
  });
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
