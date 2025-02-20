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
  pname = "etsi_its_mapem_ts_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "13bfb39e89e34c81d4f9fc8c3fc316e6cb3089c3";
        hash = "sha256-+Fgwo6X845xPOtwXE/9o1EBT+R006MIKvVYDpW1ER0Q=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS MAPEM (TS)";
  };
})
