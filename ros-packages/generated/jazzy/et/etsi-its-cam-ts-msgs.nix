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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cam_ts_msgs" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cam_ts_msgs-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "ee568b816c9b114ab9fdbc43ec5677dcc6917186";
          hash = "sha256-YUuHAWvq4MZJxeuZi+qRzThBCNBKsaf85Ky5A16aVC8=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for ETSI ITS CAM (TS)";
  };
})
