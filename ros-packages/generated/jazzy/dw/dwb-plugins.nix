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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."dwb_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles dwb-core nav2-common nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_plugins" = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e77a0fb6ec77315a3e0300b925b6f483a1e250f9";
        hash = "sha256-QyWqZzHP1JnqWolW9blcBxX+ucw1MKjR3BuvS2gAiO0=";
      };
    };
  });
  meta = {
    description = "Standard implementations of the GoalChecker and TrajectoryGenerators for dwb_core";
  };
})
