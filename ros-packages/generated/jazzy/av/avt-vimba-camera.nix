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
let
  sources = mkSourceSet (sources: {
    "avt_vimba_camera" = substituteSource {
      src = fetchgit {
        name = "avt_vimba_camera-source";
        url = "https://github.com/ros2-gbp/avt_vimba_camera-release.git";
        rev = "b9560dba83cf75fde6656e573957548ef314dec6";
        hash = "sha256-b1YFGg6j0b9K0ewtxAKbcnT1um/8yTIj7XIIbEChDbY=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "avt_vimba_camera";
  version = "2001.1.0-6";
  src = finalAttrs.passthru.sources."avt_vimba_camera";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-info-manager diagnostic-msgs diagnostic-updater image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs std-msgs stereo-image-proc ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Camera driver for Allied Vision Technologies (AVT) cameras, based on their Vimba SDK.";
  };
})
