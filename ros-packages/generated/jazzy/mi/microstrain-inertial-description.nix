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
  version = "4.5.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru = {
    sources = mkSourceSet (sources: {
      "microstrain_inertial_description" = substituteSource {
        src = fetchgit {
          name = "microstrain_inertial_description-source";
          url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
          rev = "fe8b560db7eea571a05cc2ea83169cb4a764b902";
          hash = "sha256-toCpyM8Wt3R5CUCX2yEfTZqwMNero5T5IfiJ4+IGrcc=";
        };
      };
    });
  };
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
