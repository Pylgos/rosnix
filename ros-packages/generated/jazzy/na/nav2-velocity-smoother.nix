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
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_velocity_smoother";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-util rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-util rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "nav2_velocity_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "58fdd14acdbb561d0181f1da8fc18006080f7b71";
        hash = "sha256-0rQGDQFx6ykDOq3IOKzynei6px9vvXg9TW1vu67d0g8=";
      };
    };
  });
  meta = {
    description = "Nav2's Output velocity smoother";
  };
})
