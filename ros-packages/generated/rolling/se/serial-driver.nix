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
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "serial_driver" = substituteSource {
      src = fetchgit {
        name = "serial_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "5b14e2c9bc4cd956a787b6b94e60b1b927a9e4bd";
        hash = "sha256-1Oc6jtsGEX0Jaxqs7jdlxu/nZJxZPxvagRST+L9bdwI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "serial_driver";
  version = "1.2.0-3";
  src = sources."serial_driver";
  nativeBuildInputs = [ ament-cmake-auto asio-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ io-context rclcpp rclcpp-components rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A template class and associated utilities which encapsulate basic reading from serial ports";
  };
}
