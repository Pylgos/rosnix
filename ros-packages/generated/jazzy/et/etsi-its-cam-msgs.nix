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
  pname = "etsi_its_cam_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "46d8d67c421eb18c67e3865d521c311e0c31b593";
        hash = "sha256-7J27URQFxOWwiTpcapmwmWxwyZaQwGZJR9xB8e6ALpQ=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM";
  };
})
