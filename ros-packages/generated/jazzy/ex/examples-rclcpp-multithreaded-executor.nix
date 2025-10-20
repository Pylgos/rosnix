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
  version = "0.19.7-1";
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
        rev = "3582adc745ef65c66b58eba367305537429aaf35";
        hash = "sha256-+cY5n/UpUkp2hpgTpbu8QN+iNuu5DZgX0MVVtiTr604=";
      };
    };
  });
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
