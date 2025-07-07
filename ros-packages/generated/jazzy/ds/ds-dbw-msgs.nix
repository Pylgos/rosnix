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
  version = "2.3.5-1";
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
        rev = "7c96ace7e33e2ad2f91cd55901767acfbc3dcb3d";
        hash = "sha256-6CUyanKWrO+bCwPOBnoJ0nAGdXB9WRu116HEhtwwNZA=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages\n  ";
  };
})
