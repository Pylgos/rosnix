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
  version = "2.6.0-1";
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
        rev = "8f1ad07a06440b3f231992cd54bd8cd581e84b49";
        hash = "sha256-GwtruqK0Ny2flzrVtE+k+PiAw3hBYTDChIk0dn4IuhE=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
