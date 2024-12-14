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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."dwb_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles dwb-core nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_plugins" = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7bc16aa1c68eba4f9fb26a532e879f0e32fc1253";
        hash = "sha256-Gv9qdgzl0MMfRwSFx5uufpEgtw8q0hhROI45ZV6maDc=";
      };
    };
  });
  meta = {
    description = "Standard implementations of the GoalChecker and TrajectoryGenerators for dwb_core";
  };
})
