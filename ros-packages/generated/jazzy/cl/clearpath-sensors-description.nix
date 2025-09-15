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
  version = "2.7.2-1";
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
        rev = "78ed149948670a1bfba19c87c068f55696ae4b55";
        hash = "sha256-jtTkVosZkD6aEBCeP5qa1uAsp3OtEfPRo7zrQuAAgbI=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
