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
  pname = "etsi_its_mcm_uulm_msgs";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ ros-environment rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "fa6b07c820f7749e91043c759074ddc4f3033510";
        hash = "sha256-x6Jc91UMi+gAWZW3cccHYzPaJ3A2K0BLl9BGrV+iDdA=";
      };
    };
  });
  meta = {
    description = "ROS messages for draft MCM (TS) version of UULM";
  };
})
