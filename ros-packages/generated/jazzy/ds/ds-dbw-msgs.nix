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
  version = "2.3.9-1";
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
        rev = "a0bcfd2591960ccf23a778973d269abbbf458938";
        hash = "sha256-CVxGV6TNWnB/VBaOMrSxLw7sc0oHy77kHLfoWiHqIq0=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages\n  ";
  };
})
