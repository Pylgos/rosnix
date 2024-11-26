{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "lifecycle" = substituteSource {
        src = fetchgit {
          name = "lifecycle-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "3ab6e3dbc213e2abd88a91deccd691936bb0610e";
          hash = "sha256-BShj/OjZWPBpP5W1vMvsI7CIX6BNdb0EH/PHCxsM2sA=";
        };
      };
    });
  };
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
