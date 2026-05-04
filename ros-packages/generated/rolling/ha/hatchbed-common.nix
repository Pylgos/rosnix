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
  version = "0.1.5-2";
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
        rev = "24a4894d69e03e776238d250721434d96cacbec9";
        hash = "sha256-Cik2WzNQb+DZ3lVJsQhz9K6J7gDVVVUXttDCJbm/SoA=";
      };
    };
  });
  meta = {
    description = "Common Hatchbed C++ utility code for ROS, such registering and handling updates to ros parameters.";
  };
})
