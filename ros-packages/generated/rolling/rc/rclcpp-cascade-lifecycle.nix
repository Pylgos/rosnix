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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."rclcpp_cascade_lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp_cascade_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "19ed935ed403aea2fa8802609ece5f046fed0e90";
        hash = "sha256-ElDoDKG2IOqaJbwLlcwz3HZlo000PJtpDT765zDOxOU=";
      };
    };
  });
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
})
