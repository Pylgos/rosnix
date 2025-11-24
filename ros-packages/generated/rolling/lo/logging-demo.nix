{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "logging_demo";
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."logging_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rcutils rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rcutils rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "logging_demo" = substituteSource {
      src = fetchgit {
        name = "logging_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "392ab4de8d02dd655b9a54dac5854676acd6a41a";
        hash = "sha256-8UJyKeBsQVGb7JSYAf/pgV2dBnTc7EWuHZ8eggV52qs=";
      };
    };
  });
  meta = {
    description = "Examples for using and configuring loggers.";
  };
})
