{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  asio-cmake-module,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  io-context,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  udp-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "udp_driver";
  version = "1.2.0-3";
  src = finalAttrs.passthru.sources."udp_driver";
  nativeBuildInputs = [ ament-cmake-auto asio-cmake-module ];
  propagatedBuildInputs = [ io-context lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs udp-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "udp_driver" = substituteSource {
        src = fetchgit {
          name = "udp_driver-source";
          url = "https://github.com/ros2-gbp/transport_drivers-release.git";
          rev = "6687fb0cf8866979dffca6fdea7dd91244cb24d9";
          hash = "sha256-ufshq3ku5f0OLD1L+CJhsfg8tSqLiOzmXueZGXDO9+4=";
        };
      };
    });
  };
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications, ROS and ROS2 nodes";
  };
})
