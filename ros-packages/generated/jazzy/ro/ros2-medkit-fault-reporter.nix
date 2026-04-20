{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  ros2-medkit-cmake,
  ros2-medkit-fault-manager,
  ros2-medkit-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_fault_reporter";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_fault_reporter";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2-medkit-msgs ];
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ rclcpp ros2-medkit-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing-ament-cmake launch-testing-ros ros2-medkit-fault-manager ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_fault_reporter" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_fault_reporter-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "e691e4c4ca201f75c718c4455913e692a49f1907";
        hash = "sha256-EcXQ3PpzBcQT6GifCsV36FIQfDUaTk1+9adIjYFZj3o=";
      };
    };
  });
  meta = {
    description = "Client library for easy fault reporting with local filtering";
  };
})
