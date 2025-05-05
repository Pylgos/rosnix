{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cascade-lifecycle-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp_cascade_lifecycle";
  version = "2.0.0-3";
  src = finalAttrs.passthru.sources."rclcpp_cascade_lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_cascade_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "b02a414997b15108b97f68abd3bd0afd12b86d8a";
        hash = "sha256-tJ+QyrBJij5KGBc/C7qOJIbVs9xcT5mG8e6fFABi1wI=";
      };
    };
  });
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
})
