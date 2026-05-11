{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "logging_demo";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."logging_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rclcpp-components rcutils rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components rcutils rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "logging_demo" = substituteSource {
      src = fetchgit {
        name = "logging_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "39752c7de380645f008ddcdecaea96914b77b087";
        hash = "sha256-g7sTkdfvihR1dZwY4z9P9X+ThcwK71MMMcgQ1STG+5k=";
      };
    };
  });
  meta = {
    description = "Examples for using and configuring loggers.";
  };
})
