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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."ds_dbw";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-joystick-demo ds-dbw-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw" = substituteSource {
      src = fetchgit {
        name = "ds_dbw-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "5615cb7d3a14d94aa8f624e4a430c860b4b35fd0";
        hash = "sha256-Gm7emlegv1YxJuFQvb+wNpnV5BNaFkJ+ocjb4a+9L5Y=";
      };
    };
  });
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kits";
  };
})
