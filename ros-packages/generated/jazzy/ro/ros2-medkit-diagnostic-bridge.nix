{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  ros2-medkit-cmake,
  ros2-medkit-fault-manager,
  ros2-medkit-fault-reporter,
  ros2-medkit-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_diagnostic_bridge";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_diagnostic_bridge";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-fault-reporter ros2-medkit-msgs ];
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp ros2-medkit-fault-reporter ros2-medkit-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing-ament-cmake launch-testing-ros ros2-medkit-fault-manager ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_diagnostic_bridge" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_diagnostic_bridge-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "f2ec3e6e860d9460961378814eb66d720a450d83";
        hash = "sha256-+JTv6FGGx0vDaPOlNOjbNuKZqQwoQ+AXiOKEDmpE1+s=";
      };
    };
  });
  meta = {
    description = "Bridge node converting ROS2 /diagnostics to FaultManager faults";
  };
})
