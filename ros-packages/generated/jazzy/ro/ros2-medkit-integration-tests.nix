{
  ament-cmake,
  ament-cmake-python,
  ament-index-python,
  buildAmentCmakePackage,
  diagnostic-msgs,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  ros2-medkit-cmake,
  ros2-medkit-fault-manager,
  ros2-medkit-gateway,
  ros2-medkit-graph-provider,
  ros2-medkit-linux-introspection,
  ros2-medkit-msgs,
  ros2-medkit-param-beacon,
  ros2-medkit-topic-beacon,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_integration_tests";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_integration_tests";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs example-interfaces rcl-interfaces rclcpp rclcpp-action ros2-medkit-msgs sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake ament-cmake-python ros2-medkit-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs example-interfaces rcl-interfaces rclcpp rclcpp-action ros2-medkit-msgs sensor-msgs std-msgs std-srvs ];
  checkInputs = [ ament-index-python launch-ros launch-testing launch-testing-ament-cmake ros2-medkit-fault-manager ros2-medkit-gateway ros2-medkit-graph-provider ros2-medkit-linux-introspection ros2-medkit-param-beacon ros2-medkit-topic-beacon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_integration_tests" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_integration_tests-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "2dc09f8b1fe49aeb7864972a95c0a7c2dd180bff";
        hash = "sha256-jHEDPTzhPkQJX0T5IgaKGNHdxQqvJglIMZlfML6rN6Y=";
      };
    };
  });
  meta = {
    description = "Integration tests and demo nodes for ros2_medkit";
  };
})
