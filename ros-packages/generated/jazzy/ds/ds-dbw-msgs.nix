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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."ds_dbw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_msgs" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "dd929a0c8d46bd6d43042402911c3bdc6c95ca99";
        hash = "sha256-W3mKZbTgALAxfz6JoQRUR7RTFbYSEQN1BqdWEk0KEMA=";
      };
    };
  });
  meta = {
    description = "Drive-by-wire messages";
  };
})
