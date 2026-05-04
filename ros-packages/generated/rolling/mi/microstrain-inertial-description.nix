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
  version = "4.8.0-2";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_description" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "0a1fbc7d586788149f92d84f30d748ccd06448d6";
        hash = "sha256-CBTJCzK7So+BgagCmEL1xZCVA1WaacEaGYcItzjjWao=";
      };
    };
  });
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
