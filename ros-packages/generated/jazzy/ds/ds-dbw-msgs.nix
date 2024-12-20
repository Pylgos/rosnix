{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ds_dbw_msgs";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."ds_dbw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_msgs" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "8188cb57633e17c73bef056ec022e5264e6cffb2";
        hash = "sha256-p4qf9yPTiocybY9EOQKtay/rlHgYiw+5BMq+HUNMG3U=";
      };
    };
  });
  meta = {
    description = "Drive-by-wire messages";
  };
})
