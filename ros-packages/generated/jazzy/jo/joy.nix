{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sdl2-vendor,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joy";
  version = "3.3.0-3";
  src = finalAttrs.passthru.sources."joy";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sdl2-vendor sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sdl2-vendor sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "joy" = substituteSource {
      src = fetchgit {
        name = "joy-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "67a9a49bc8f5af4f3bb4631169fb4364ec3bbb42";
        hash = "sha256-D1K9/q5C0I7lztfZMomXMVDmBUV0UKvl2iNljHx2pPY=";
      };
    };
  });
  meta = {
    description = " The joy package contains joy_node, a node that interfaces a generic joystick to ROS\n    2. This node publishes a \"Joy\" message, which contains the current state of each one of the\n    joystick's buttons and axes. ";
  };
})
