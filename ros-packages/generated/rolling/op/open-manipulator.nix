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
  version = "4.0.7-1";
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
        rev = "20769bd8ddd4379049993b30278d91d3fc71a4f1";
        hash = "sha256-dmDb/3PTBa8gY+YgM6XaA6CSC1Ah4tDKSvU+mHEdwDM=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR meta ROS 2 package.\n  ";
  };
})
