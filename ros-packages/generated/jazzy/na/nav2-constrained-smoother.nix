{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_constrained_smoother";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_constrained_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_constrained_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "91e675f00c858c7dc9e6c74e027325283bdd07ed";
        hash = "sha256-PUp+Zkunc2gPvP0wrThKc1uAB11plrFbBaB3rAEggn4=";
      };
    };
  });
  meta = {
    description = "Ceres constrained smoother";
  };
})
