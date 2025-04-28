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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9fd160957ecce71c44a13eb00ff16f7b826f8425";
        hash = "sha256-PSSdsFVARG8eZ4ptQuYD/GK4olaGtlbgTe9QfxVSo+8=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS MAPEM (TS)";
  };
})
