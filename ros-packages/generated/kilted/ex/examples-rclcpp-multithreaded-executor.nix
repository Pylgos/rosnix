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
  version = "0.20.6-2";
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
        rev = "14a441dc7806da31dc18d92e12877d29c7b0813f";
        hash = "sha256-YWKRde/MxBibP87GK2DMGxgEmueZvXIK/Js8PTymL3w=";
      };
    };
  });
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
