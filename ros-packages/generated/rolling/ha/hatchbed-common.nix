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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."hatchbed_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "hatchbed_common" = substituteSource {
        src = fetchgit {
          name = "hatchbed_common-source";
          url = "https://github.com/ros2-gbp/hatchbed_common-release.git";
          rev = "e02ba7ea72c77f2b15675b0655cfef77537f7e9e";
          hash = "sha256-c1poWAtmemh2EMWWZWMhAp/tymKR/qJpxU9GsHG7U8U=";
        };
      };
    });
  };
  meta = {
    description = "Common Hatchbed C++ utility code for ROS, such registering and handling updates to ros parameters.";
  };
})
