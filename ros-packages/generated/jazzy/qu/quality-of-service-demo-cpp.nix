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
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-implementation-cmake ];
  propagatedBuildInputs = [ example-interfaces launch-ros rclcpp rclcpp-components rcutils rmw sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common launch launch-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "quality_of_service_demo_cpp" = substituteSource {
        src = fetchgit {
          name = "quality_of_service_demo_cpp-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "df700e3cb17eb057da4e7abe1230ffce08ed51d5";
          hash = "sha256-HNcDL/KHSIWlJ2YyOByfe7Ipi2Dm8+h0fuzTYhwdRWE=";
        };
      };
    });
  };
  meta = {
    description = "C++ Demo applications for Quality of Service features";
  };
})
