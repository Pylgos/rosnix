{
  ament-cmake-auto,
  buildAmentCmakePackage,
  camera-info-manager,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-proc,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-image-proc,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "avt_vimba_camera";
  version = "2001.1.0-5";
  src = finalAttrs.passthru.sources."avt_vimba_camera";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-msgs diagnostic-updater image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs std-msgs stereo-image-proc ];
  passthru.sources = mkSourceSet (sources: {
    "avt_vimba_camera" = substituteSource {
      src = fetchgit {
        name = "avt_vimba_camera-source";
        url = "https://github.com/ros2-gbp/avt_vimba_camera-release.git";
        rev = "7e56860bfcd8f29a48630b2d050f3451b0617a3b";
        hash = "sha256-b1YFGg6j0b9K0ewtxAKbcnT1um/8yTIj7XIIbEChDbY=";
      };
    };
  });
  meta = {
    description = "Camera driver for Allied Vision Technologies (AVT) cameras, based on their Vimba SDK.";
  };
})
