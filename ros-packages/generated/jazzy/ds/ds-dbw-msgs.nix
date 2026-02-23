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
  version = "2.3.11-1";
  src = finalAttrs.passthru.sources."ds_dbw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_msgs" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "e7c6f4e4e9bb701cd657216bf1789b0a80f55b42";
        hash = "sha256-uErCfuowxshzMjw7IiVWrEBAGFS+g1ImwsU2DwvET44=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages\n  ";
  };
})
