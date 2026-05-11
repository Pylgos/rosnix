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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "quality_of_service_demo_cpp";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils rmw rmw-implementation-cmake sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_cpp" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "34faa0137888554243aab1024275a1028511c138";
        hash = "sha256-Q8dL/PkhRc6QB0RNWjn+uaqmNcM8bvDQrBTRyZOissI=";
      };
    };
  });
  meta = {
    description = "C++ Demo applications for Quality of Service features";
  };
})
