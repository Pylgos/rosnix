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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "d1bd73be1e67838590840eb90a353c840446ecef";
        hash = "sha256-fnQXkHnGLJCl2B+S6N3a4u/+syl3tqgMlJ/eOjuU5ks=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM (TS)";
  };
})
