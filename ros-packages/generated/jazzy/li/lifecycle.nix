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
  version = "0.33.9-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle" = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "4e3ffce5edb93c9d1a7ccb33604054c23ecc1f01";
        hash = "sha256-7xg7TbVRmaoIUZ6fUKrgaTBoV5o6ZE1F6PAz565KLuc=";
      };
    };
  });
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
