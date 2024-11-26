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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rclcpp_cascade_lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rclcpp_cascade_lifecycle" = substituteSource {
        src = fetchgit {
          name = "rclcpp_cascade_lifecycle-source";
          url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
          rev = "725ec2485afc1dc88ad80e53ec89d0d77e233125";
          hash = "sha256-tJ+QyrBJij5KGBc/C7qOJIbVs9xcT5mG8e6fFABi1wI=";
        };
      };
    });
  };
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
})
