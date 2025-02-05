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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_offboard_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport image-transport-plugins velodyne-pointcloud ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_offboard_sensors" = substituteSource {
      src = fetchgit {
        name = "clearpath_offboard_sensors-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "04f877510b804b3d9ad07ba32f7ff32069f77e83";
        hash = "sha256-i9PKhySsUJGYrrJ+1AGgsa+GTuAcc7B/uXMpH37O7fI=";
      };
    };
  });
  meta = {
    description = "Launch files for decompressing and consuming high-bandwidth sensor data on offboard computers";
  };
})
