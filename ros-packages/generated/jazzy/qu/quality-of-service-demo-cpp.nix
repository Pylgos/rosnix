{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "quality_of_service_demo_cpp";
  version = "0.33.8-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_cpp" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "cf0c21f8f8537c88bbc8b05ba55cc41196647e1c";
        hash = "sha256-/+8cosP59RwZ1MOq2SnldeS/+YqMg97em4w+4lK+89E=";
      };
    };
  });
  meta = {
    description = "C++ Demo applications for Quality of Service features";
  };
})
