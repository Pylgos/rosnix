{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_fake";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_fake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_fake" = substituteSource {
      src = fetchgit {
        name = "raspimouse_fake-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "da9a9351649baeceac1f177bafe0859f8d7ac930";
        hash = "sha256-U5a/d03zmyJ+AH9bj0JDuWnNAW0s52PeQlu4L2PBkB8=";
      };
    };
  });
  meta = {
    description = "The raspimouse_control package";
  };
})
