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
  version = "3.4.0-1";
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
        rev = "51be710dddae27fc92aa961feb115e8cc4104ae5";
        hash = "sha256-SwD8hkdFrMDQ811ug7oCgjrADuemYAapXRuCRiDXwvQ=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CAM";
  };
})
