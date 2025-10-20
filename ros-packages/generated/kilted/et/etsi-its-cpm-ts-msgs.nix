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
  pname = "etsi_its_cpm_ts_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "334b70ca06c8db2d521d5ef4d94849de834d451a";
        hash = "sha256-3iIBi5AT4wDZfOzQUw8rwwQXEfw8BOLQnXCVzt0WkVU=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
})
