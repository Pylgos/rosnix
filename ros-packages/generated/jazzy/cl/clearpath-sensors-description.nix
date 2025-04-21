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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."clearpath_sensors_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ axis-description microstrain-inertial-description realsense2-description velodyne-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_sensors_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_sensors_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "61493204e097b13fa18e724dce71f0f637ebc3da";
        hash = "sha256-sYUfJ5yVW+kl812J/JNXJJ4rOjzKHVnFxjqThjtgcIo=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
