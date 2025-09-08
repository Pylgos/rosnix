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
  version = "1.1.11-1";
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
        rev = "981d67881e37b2b54ba5d3c59dfd5452c21d0e93";
        hash = "sha256-jBHDy7CW1hIR7fvMKyUIAfdp0NSS9oaYfW5w39uaXug=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 meta package for FFW\n  ";
  };
})
