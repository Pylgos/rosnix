{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  dwb-core,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_plugins";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."dwb_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles dwb-core nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_plugins" = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a1d40c466361558a99e58bd05b63ea85aa2d7955";
        hash = "sha256-6ggyMLRqTysWTi31hEaDs38DnheFkbiGyrAikf60cR0=";
      };
    };
  });
  meta = {
    description = "Standard implementations of the GoalChecker and TrajectoryGenerators for dwb_core";
  };
})
