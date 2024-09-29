{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  camera-aravis2-msgs,
  camera-info-manager,
  cv-bridge,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
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
    "camera_aravis2" = substituteSource {
      src = fetchgit {
        name = "camera_aravis2-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "5f3e3d8ced22c864b03026f8804b1a5b45aa0648";
        hash = "sha256-5Ah7DOmJ1tb7bQ9XttTlDnsH6igmEM8S5i3sZm4pWZc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "camera-aravis2";
  version = "1.0.0-1";
  src = sources."camera_aravis2";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-aravis2-msgs camera-info-manager cv-bridge diagnostic-msgs image-transport rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "aravis-dev" "libglib-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 camera driver for [GenICam](https://www.emva.org/standards-technology/genicam/)-based GigEVision and USB3Vision cameras.";
  };
}
