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
  pname = "etsi_its_cam_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cam_msgs" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cam_msgs-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "2b77f6dcfd018e6605cd612d22887b5a3d447b3c";
          hash = "sha256-vONf+kjCENAs0Mnox43hcqIDN7axwh69asc0F6R2iTM=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for ETSI ITS CAM";
  };
})
