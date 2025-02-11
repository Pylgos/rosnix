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
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_smoother";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action rclcpp-components std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e2a8cc4044a03edaa69fbbcd78afe078722dd306";
        hash = "sha256-QvPTxoSCdwT2a8AhMuGwQiwT5nw8Lj3whjbJs6kk/2k=";
      };
    };
  });
  meta = {
    description = "Smoother action interface";
  };
})
