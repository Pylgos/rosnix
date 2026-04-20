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
  ffw-robot-manager,
  ffw-spring-actuator-controller,
  ffw-swerve-drive-controller,
  ffw-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffw";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."ffw";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ffw-bringup ffw-description ffw-joint-trajectory-command-broadcaster ffw-joystick-controller ffw-moveit-config ffw-robot-manager ffw-spring-actuator-controller ffw-swerve-drive-controller ffw-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ffw-bringup ffw-description ffw-joint-trajectory-command-broadcaster ffw-joystick-controller ffw-moveit-config ffw-robot-manager ffw-spring-actuator-controller ffw-swerve-drive-controller ffw-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "ffw" = substituteSource {
      src = fetchgit {
        name = "ffw-source";
        url = "https://github.com/ros2-gbp/ai_worker-release.git";
        rev = "ed08b779993f8a6442b6f41ea47035dbbe77769a";
        hash = "sha256-vjAq3B8bUhZHTH/ZVPSeql4D/HKGUOATsWZvdkft5+4=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta package for FFW\n  ";
  };
})
