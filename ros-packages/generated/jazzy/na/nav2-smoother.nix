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
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles nav2-common nav2-core nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles nav2-common nav2-core nav2-msgs nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp rclcpp-action rclcpp-components std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4b1ed6445e126f4dd48bbbca69489dde37ebbbee";
        hash = "sha256-P2p/Pe0G9JKoSceBAqruVSrDcDxKZpU929IfinxrLbI=";
      };
    };
  });
  meta = {
    description = "Smoother action interface";
  };
})
