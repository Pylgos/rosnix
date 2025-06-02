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
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_constrained_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_constrained_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7c05410e063df7f2bda875656be147f3faffb84f";
        hash = "sha256-vFQQT8xKQq1yw9Ja/4lb6SkXayAuIkrupBB0LnVvUgI=";
      };
    };
  });
  meta = {
    description = "Ceres constrained smoother";
  };
})
