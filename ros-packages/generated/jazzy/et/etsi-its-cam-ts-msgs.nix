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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "15c6ba2b9d6f2f708c77ba1fc6d85ef2787a1b7c";
        hash = "sha256-Ooc8D172L6MQWxFqBOpKIAMcel1G8qJ0IOapuYzdzBI=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM (TS)";
  };
})
