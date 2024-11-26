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
  pname = "etsi_its_cpm_ts_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cpm_ts_msgs" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cpm_ts_msgs-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "e00f4dddb47afe187c748a5e4ecee17e309afddc";
          hash = "sha256-BGFnvyBN9RWordZtWmGfimBCD0Ozd8db+zEPC7Fog7g=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for ETSI ITS CPM (TS)";
  };
})
