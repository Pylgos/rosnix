{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_theta_star_planner";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_theta_star_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-action rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_theta_star_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_theta_star_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "84d0607652a4005670700e0441df6359a68aa4cd";
        hash = "sha256-wk1U6VQ/7pPDGpgRwZAOG5Gc8PDZQspeXUBbQC6CIDY=";
      };
    };
  });
  meta = {
    description = "Theta* Global Planning Plugin";
  };
})
