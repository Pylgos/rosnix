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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_sensors_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ axis-description microstrain-inertial-description realsense2-description velodyne-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_sensors_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_sensors_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "2ad57bcfd14e660a4f4b7078709ff9313d63011f";
        hash = "sha256-i9AAUd2yJ/iNTJNmaukOdqwOpe4oYyF53fUcMkwBqbg=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
