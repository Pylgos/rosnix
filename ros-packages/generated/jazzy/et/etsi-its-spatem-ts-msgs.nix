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
  pname = "etsi_its_spatem_ts_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "54eb090b361ea046561875b8a337129120ebabce";
        hash = "sha256-UoiD1iG7Lp8g+aRQortawY02jkIIEOdZ6wQRqQlUoRI=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS SPATEM (TS)";
  };
})
