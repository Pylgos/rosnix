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
  version = "1.0.8-1";
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
        rev = "36d9de93aa44995ea3a50fb62bf8c62e615cb145";
        hash = "sha256-Idt+x5UjxfUBR14lha8hRLlYAT2j2jm7RjwMUGiyJYs=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta package for FFW\n  ";
  };
})
