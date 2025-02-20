{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e90743c38aec1bd31bb9a61c79f8609a965c3b05";
        hash = "sha256-gFdjvlcBCPvaGFCnUhH37kspHYXxzuYUXDAb0Ac7Vb0=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM (TS)";
  };
})
