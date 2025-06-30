{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  om-gravity-compensation-controller,
  om-joint-trajectory-command-broadcaster,
  om-spring-actuator-controller,
  open-manipulator-bringup,
  open-manipulator-collision,
  open-manipulator-description,
  open-manipulator-gui,
  open-manipulator-moveit-config,
  open-manipulator-playground,
  open-manipulator-teleop,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator";
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."open_manipulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ om-gravity-compensation-controller om-joint-trajectory-command-broadcaster om-spring-actuator-controller open-manipulator-bringup open-manipulator-collision open-manipulator-description open-manipulator-gui open-manipulator-moveit-config open-manipulator-playground open-manipulator-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ om-gravity-compensation-controller om-joint-trajectory-command-broadcaster om-spring-actuator-controller open-manipulator-bringup open-manipulator-collision open-manipulator-description open-manipulator-gui open-manipulator-moveit-config open-manipulator-playground open-manipulator-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator" = substituteSource {
      src = fetchgit {
        name = "open_manipulator-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "b3666c5617c39f2e1f6a761b7bc0601608cfc8c9";
        hash = "sha256-hoisQJchZamNxNAQfO/Ct4Pxgif5yQaE+sErfj1RgTw=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR meta ROS 2 package.\n  ";
  };
})
