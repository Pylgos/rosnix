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
let
  sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1da9704320652a116b4ef468c03260e5732f22ea";
        hash = "sha256-mPSUiQqDaQ0KTIwz1NphJFePBewAxaHqIt98lygkCr8=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cpm_ts_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
})
