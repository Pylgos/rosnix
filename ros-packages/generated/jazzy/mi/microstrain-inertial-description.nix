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
  version = "4.6.1-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_description" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "dafbd91c956c3dda4d7354b6340296e0d6ecc103";
        hash = "sha256-CwxatWJBt+2eivgV7IZwKzc5yuEoJYmEbYxDv7PHWc0=";
      };
    };
  });
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
