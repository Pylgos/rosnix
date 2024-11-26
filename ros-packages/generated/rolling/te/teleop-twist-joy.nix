{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  joy,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "teleop_twist_joy";
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."teleop_twist_joy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs joy rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_twist_joy" = substituteSource {
      src = fetchgit {
        name = "teleop_twist_joy-source";
        url = "https://github.com/ros2-gbp/teleop_twist_joy-release.git";
        rev = "4509e68c15e09d8b975b3771fdddbec5a596322c";
        hash = "sha256-nB0va0g6TkrL+6KcyPKFB7ft9opzePCbv4kYmx7f6ug=";
      };
    };
  });
  meta = {
    description = "Generic joystick teleop for twist robots.";
  };
})
