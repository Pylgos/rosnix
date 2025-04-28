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
  version = "0.37.0-1";
  src = finalAttrs.passthru.sources."logging_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rcutils rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "logging_demo" = substituteSource {
      src = fetchgit {
        name = "logging_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "633023ff9103d91a5770ff6e5e11eec5c736a1d6";
        hash = "sha256-AZmZxRpWJBApdFDtpZ9Dbj0zL37Bopv8zCPQOYH4JwI=";
      };
    };
  });
  meta = {
    description = "Examples for using and configuring loggers.";
  };
})
