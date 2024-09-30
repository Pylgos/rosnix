{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  flir-camera-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "spinnaker_camera_driver" = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "7c6a3104f5cc1e7f807d2533cda87da5bf75e416";
        hash = "sha256-MTLkSEO/NkdU6Fa/1zhCvcWbcyRFQ58qqX66+pGBmdk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "spinnaker_camera_driver";
  version = "2.0.20-1";
  src = sources."spinnaker_camera_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-info-manager flir-camera-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "dpkg" "ffmpeg" "libusb-1.0-dev" "python3-distro" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 driver for flir spinnaker sdk";
  };
}
