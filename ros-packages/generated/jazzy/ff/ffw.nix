{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ffw-bringup,
  ffw-description,
  ffw-joint-trajectory-command-broadcaster,
  ffw-joystick-controller,
  ffw-moveit-config,
  ffw-spring-actuator-controller,
  ffw-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."ffw";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ffw-bringup ffw-description ffw-joint-trajectory-command-broadcaster ffw-joystick-controller ffw-moveit-config ffw-spring-actuator-controller ffw-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ffw-bringup ffw-description ffw-joint-trajectory-command-broadcaster ffw-joystick-controller ffw-moveit-config ffw-spring-actuator-controller ffw-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "ffw" = substituteSource {
      src = fetchgit {
        name = "ffw-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "68ccf4593f468c79e5eec53cfff0208dd555f9c1";
        hash = "sha256-tPVuCu2vKwvVd+6OU9Eoiq8EAJYGE+Y/7A4GiLKac7U=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta package for FFW\n  ";
  };
})
