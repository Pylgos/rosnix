{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  compressed-image-transport,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-image-to-qimage,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  rqt-image-overlay-layer,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_image_overlay" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "086da41cf47b934b392f4c4198e9e121a566e768";
        hash = "sha256-rjv8Zxu7V4qDtMRcwMdiYByPpFiYIRJL8N+KK/Gte+E=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt-image-overlay";
  version = "0.3.1-3";
  src = sources."rqt_image_overlay";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image-transport pluginlib rclcpp ros-image-to-qimage rqt-gui rqt-gui-cpp rqt-image-overlay-layer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common compressed-image-transport std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An rqt plugin to display overlays for custom msgs on an image using plugins.";
  };
}
