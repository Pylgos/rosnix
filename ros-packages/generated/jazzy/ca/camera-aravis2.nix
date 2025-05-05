{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_aravis2";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."camera_aravis2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ camera-aravis2-msgs camera-info-manager cv-bridge diagnostic-msgs image-transport rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "aravis-dev" "libglib-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "camera_aravis2" = substituteSource {
      src = fetchgit {
        name = "camera_aravis2-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "a9f7b9061720fe42ecf3042faffc946fbd5fc1d7";
        hash = "sha256-CSVTrWdleQCVzub57XrwvApge62wmzZ9cP5W57mQCn0=";
      };
    };
  });
  meta = {
    description = "ROS2 camera driver for [GenICam](https://www.emva.org/standards-technology/genicam/)-based GigEVision and USB3Vision cameras.";
  };
})
