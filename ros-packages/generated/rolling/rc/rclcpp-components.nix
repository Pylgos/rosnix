{
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_components";
  version = "30.0.0-1";
  src = finalAttrs.passthru.sources."rclcpp_components";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader composition-interfaces rclcpp rcpputils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp class-loader composition-interfaces rclcpp rcpputils ];
  checkInputs = [ ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_components" = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "47519246b54259a3faebda69490d130d928ca67a";
        hash = "sha256-1jcSZSJYMmq5H9Cz3h4ttUgRNaCmNby92sKXJ0ElR+4=";
      };
    };
  });
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
})
