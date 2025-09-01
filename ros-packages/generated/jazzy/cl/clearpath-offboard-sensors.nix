{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  image-transport-plugins,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  velodyne-pointcloud,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_offboard_sensors";
  version = "2.7.0-2";
  src = finalAttrs.passthru.sources."clearpath_offboard_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-transport image-transport-plugins velodyne-pointcloud ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport image-transport-plugins velodyne-pointcloud ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_offboard_sensors" = substituteSource {
      src = fetchgit {
        name = "clearpath_offboard_sensors-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "827a23ec460f7b4c1844c0136c51a6887927e890";
        hash = "sha256-aJcIMaiBwkiZRW6DlqspoGmgHD59c7UfR8NdlwvF/sY=";
      };
    };
  });
  meta = {
    description = "Launch files for decompressing and consuming high-bandwidth sensor data on offboard computers";
  };
})
