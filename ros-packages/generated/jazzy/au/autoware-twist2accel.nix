{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-agnocast-wrapper,
  autoware-cmake,
  autoware-lint-common,
  autoware-signal-processing,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_twist2accel";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_twist2accel";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-agnocast-wrapper autoware-signal-processing geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-agnocast-wrapper autoware-signal-processing geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_twist2accel" = substituteSource {
      src = fetchgit {
        name = "autoware_twist2accel-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d832e5beda4b14577bf4bcd0ca2c45d0011f3412";
        hash = "sha256-IvdgfnbSCcLpkSE6HtCUZc55RvBhDvE9Yo1PjjAizPo=";
      };
    };
  });
  meta = {
    description = "The acceleration estimation package";
  };
})
