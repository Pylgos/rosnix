{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "97e1ff5431cc19cc3dce639d7e58c93d152ea0bc";
        hash = "sha256-zeJWTtK2yPMjA4azbbu7r8qHdEOX0tw4OEwZjob5aMg=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM (TS)";
  };
})
