{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_velocity_smoother";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_velocity_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-util rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_velocity_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b3fd63450156bc9522c945115efbdfcb47e28f82";
        hash = "sha256-UqDpIaY2aGGN3A5+IBf58zFhBGP/7vYDyWsi+rAyHx4=";
      };
    };
  });
  meta = {
    description = "Nav2's Output velocity smoother";
  };
})
