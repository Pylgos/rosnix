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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "7768cd7f8bdcd914ec879967d512edba33f1a36e";
        hash = "sha256-OEomcRCF29/+i3pH5SA6YFUnwbvodskNQzglY15h/G8=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM";
  };
})
