{
  ament-cmake,
  axis-description,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  microstrain-inertial-description,
  mkSourceSet,
  realsense2-description,
  rosSystemPackages,
  substituteSource,
  velodyne-description,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_sensors_description";
  version = "2.8.4-1";
  src = finalAttrs.passthru.sources."clearpath_sensors_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ axis-description microstrain-inertial-description realsense2-description velodyne-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ axis-description microstrain-inertial-description realsense2-description velodyne-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_sensors_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_sensors_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "087cdfe61c4277ceb8874a7220fe277768b7bd35";
        hash = "sha256-YWCXHmW6NghV5Orv8neHZe9QdnD9PuLx8DMvCH66w1k=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
