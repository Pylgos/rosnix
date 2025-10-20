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
  version = "1.1.14-1";
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
        rev = "98f8b98dc8453c37193fe45b6e9a7c95507eb078";
        hash = "sha256-ZrMTVn1lmGa6uq2ESSMDGkg27BBumNn/2rF2rCEaFG4=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta package for FFW\n  ";
  };
})
