{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-abstract-core,
  mbf-msgs,
  mbf-utility,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_abstract_nav";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_abstract_nav";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-abstract-core mbf-msgs mbf-utility nav-msgs rclcpp rclcpp-action std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-abstract-core mbf-msgs mbf-utility nav-msgs rclcpp rclcpp-action std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_abstract_nav" = substituteSource {
      src = fetchgit {
        name = "mbf_abstract_nav-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "5f1dc8881971e6bfad8d6b7d4d5b3b80d38f3c96";
        hash = "sha256-nBWdhrIrBsxTjlA6gUbqHo0K5d43cSHfASdNvvXNtpQ=";
      };
    };
  });
  meta = {
    description = "\n    The mbf_abstract_nav package contains the abstract navigation server implementation of Move Base Flex (MBF). The abstract navigation server is not bound to any map representation. It provides the actions for planning, controlling and recovering. MBF loads all defined plugins at the program start. Therefor, it loads all plugins which are defined in the lists *planners*, *controllers* and *recovery_behaviors*. Each list holds a pair of a *name* and a *type*. The *type* defines which kind of plugin to load. The *name* defines under which name the plugin should be callable by the actions.\n  ";
  };
})
