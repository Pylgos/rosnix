{
  ament-cmake,
  buildAmentCmakePackage,
  ds-dbw-can,
  ds-dbw-joystick-demo,
  ds-dbw-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ds_dbw";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."ds_dbw";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ds-dbw-can ds-dbw-joystick-demo ds-dbw-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-joystick-demo ds-dbw-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw" = substituteSource {
      src = fetchgit {
        name = "ds_dbw-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "3bcb4c1afb1bfbc3ca90c5aee99704a691535876";
        hash = "sha256-N6RoEVij5v7mHaAI7T0925RYigkuKLGatB9DsCJ8Fbw=";
      };
    };
  });
  meta = {
    description = "\n    Interface to the Dataspeed Inc. Drive-By-Wire kits\n  ";
  };
})
