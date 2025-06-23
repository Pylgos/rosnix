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
  version = "4.0.0-1";
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
        rev = "fbdc319f7a24eda84663d15d1ffcf2a586ed5c39";
        hash = "sha256-zDEJ+LXpUDljfjuiwFXVf1m+PXUdauuc67nDpdtF7OY=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR meta ROS 2 package.\n  ";
  };
})
