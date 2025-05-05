{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  beluga,
  beluga-ros,
  bondcpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beluga_amcl";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."beluga_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "beluga_amcl" = substituteSource {
      src = fetchgit {
        name = "beluga_amcl-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "0a28678898be6587e8ef29c6a5d96109761837b1";
        hash = "sha256-o5w8tS4fYcmaf9rRYPabtPGEs27Xf50+6nRPhhPN7B8=";
      };
    };
  });
  meta = {
    description = "An AMCL node implementation for ROS2 using Beluga.";
  };
})
