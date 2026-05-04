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
  version = "1.3.12-1";
  src = finalAttrs.passthru.sources."dwb_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles dwb-core nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles dwb-core nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_plugins" = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a056c894d58ad19e92116548c9c221fde7b4a893";
        hash = "sha256-YhsKWs5Ntk7gIpYQAMtUkiiSiQ7Z8NexBraM5PxfCDU=";
      };
    };
  });
  meta = {
    description = "\n      Standard implementations of the GoalChecker\n      and TrajectoryGenerators for dwb_core\n  ";
  };
})
