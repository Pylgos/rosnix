{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  asio-cmake-module,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "udp_driver" = substituteSource {
      src = fetchgit {
        name = "udp_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "6687fb0cf8866979dffca6fdea7dd91244cb24d9";
        hash = "sha256-ufshq3ku5f0OLD1L+CJhsfg8tSqLiOzmXueZGXDO9+4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "udp_driver";
  version = "1.2.0-3";
  src = sources."udp_driver";
  nativeBuildInputs = [ ament-cmake-auto asio-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ io-context lifecycle-msgs rclcpp rclcpp-components rclcpp-lifecycle std-msgs udp-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications, ROS and ROS2 nodes";
  };
}
