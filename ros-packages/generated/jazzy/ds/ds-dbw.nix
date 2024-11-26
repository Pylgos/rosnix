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
  version = "2.2.3-1";
  src = finalAttrs.passthru.sources."ds_dbw";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-joystick-demo ds-dbw-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ds_dbw" = substituteSource {
        src = fetchgit {
          name = "ds_dbw-source";
          url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
          rev = "31b50c61bd815df2fb62a0a3a1d41c09c5256434";
          hash = "sha256-LvPfBy8hXUAqsUdQ9uvwWJJMMd9nQb0oonRtTM1RCX4=";
        };
      };
    });
  };
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kits";
  };
})
