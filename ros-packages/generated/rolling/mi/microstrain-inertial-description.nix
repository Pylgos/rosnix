{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_description";
  version = "4.6.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_description" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "bcfa3173c639a7a1d81ea60a6935ae28ddaaa35a";
        hash = "sha256-YgRSfksm5b6WpacMV0UJpyxdZrrIbHAHoXE6j65IjRQ=";
      };
    };
  });
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
