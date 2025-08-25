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
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_constrained_smoother";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_constrained_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-lifecycle tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp rclcpp-lifecycle tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common angles ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_constrained_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "8a56f4b43c66ee7fff7d6474ce470fb7322516ad";
        hash = "sha256-qzmYaCOOAVFDYJhfez1ihMWNNtNBk+IN3A7vTKTgPfw=";
      };
    };
  });
  meta = {
    description = "Ceres constrained smoother";
  };
})
