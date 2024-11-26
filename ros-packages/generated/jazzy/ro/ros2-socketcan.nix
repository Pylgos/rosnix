{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  ros2-socketcan-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_socketcan";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."ros2_socketcan";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ can-msgs lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle ros2-socketcan-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2_socketcan" = substituteSource {
        src = fetchgit {
          name = "ros2_socketcan-source";
          url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
          rev = "34e8b4d086c2cd3a25264505342e402e942e430b";
          hash = "sha256-+pXj+cTr4khaX16vO9udW9wG0Acdjndi7NydrNL2uZo=";
        };
      };
    });
  };
  meta = {
    description = "Simple wrapper around SocketCAN";
  };
})
