{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "lifecycle" = substituteSource {
        src = fetchgit {
          name = "lifecycle-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "1823823205a089832815e05640dad53767409e21";
          hash = "sha256-VHQgUWaJSHvx2KXRHjClZcq/8Ev3gBFQzXfavsmv8Lc=";
        };
      };
    });
  };
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
