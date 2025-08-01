{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hatchbed_common";
  version = "0.1.2-2";
  src = finalAttrs.passthru.sources."hatchbed_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hatchbed_common" = substituteSource {
      src = fetchgit {
        name = "hatchbed_common-source";
        url = "https://github.com/ros2-gbp/hatchbed_common-release.git";
        rev = "471c976f218f5f7cc4081735ab077d5bfdbf869a";
        hash = "sha256-7crWcDtg92DymEUVRdXVWwe2G9BjJkD1zbyBD0qAbHM=";
      };
    };
  });
  meta = {
    description = "Common Hatchbed C++ utility code for ROS, such registering and handling updates to ros parameters.";
  };
})
