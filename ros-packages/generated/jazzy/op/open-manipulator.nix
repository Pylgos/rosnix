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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."open_manipulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ om-gravity-compensation-controller om-joint-trajectory-command-broadcaster om-spring-actuator-controller open-manipulator-bringup open-manipulator-description open-manipulator-gui open-manipulator-moveit-config open-manipulator-playground open-manipulator-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator" = substituteSource {
      src = fetchgit {
        name = "open_manipulator-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "d8d4fd372c9c9651cf134e2881f627c3e3f229fd";
        hash = "sha256-26T+AyoE+QwgwRAtRXauerVwjETg/GPv+bGhwFaNUrU=";
      };
    };
  });
  meta = {
    description = "OpenMANIPULATOR meta ROS 2 package.";
  };
})
