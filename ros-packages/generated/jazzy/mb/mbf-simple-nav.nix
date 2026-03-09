{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-abstract-core,
  mbf-abstract-nav,
  mbf-msgs,
  mbf-simple-core,
  mbf-test-utility,
  mbf-utility,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_simple_nav";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_simple_nav";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-abstract-core mbf-abstract-nav mbf-msgs mbf-simple-core mbf-utility nav-msgs pluginlib rclcpp rclcpp-action std-msgs std-srvs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-abstract-core mbf-abstract-nav mbf-msgs mbf-simple-core mbf-utility nav-msgs pluginlib rclcpp rclcpp-action std-msgs std-srvs tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gmock mbf-test-utility ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_simple_nav" = substituteSource {
      src = fetchgit {
        name = "mbf_simple_nav-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "ee3b5465f221f621729a588bbcea3127fa26c4a8";
        hash = "sha256-ECbXZMDbI3aEVFBxmm0GIQ+6y7zCZkR3XAg5Bp45kzs=";
      };
    };
  });
  meta = {
    description = "\n      The mbf_simple_nav package contains a simple navigation server implementation of Move Base Flex (MBF). The simple navigation server is bound to no map representation. It provides actions for planning, controlling and recovering. MBF loads all defined plugins which are defined in the lists *planners*, *controllers* and *recovery_behaviors*. Each list holds a pair of a *name* and a *type*. The *type* defines which kind of plugin to load. The *name* defines under which name the plugin should be callable by the actions. \n\n      It tries to load the defined plugins which implements the defined interfaces in ";
  };
})
