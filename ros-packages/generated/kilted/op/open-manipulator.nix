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
  version = "4.1.2-1";
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
        rev = "d44a3dce66a1a7c96e352782971fb9126169d564";
        hash = "sha256-LdNoNNOEXBf78nhiiV8hJsAoVqwarIHCFOuYTIEn+is=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR meta ROS 2 package.\n  ";
  };
})
