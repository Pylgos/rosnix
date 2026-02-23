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
  version = "2.3.11-1";
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
        rev = "52f23699a8aee678bc05c792c6962cb58f428abb";
        hash = "sha256-D8T84xLaTpalQKumEAMUax9PuRqqX/KX5n5ZKYNMCFc=";
      };
    };
  });
  meta = {
    description = "\n    Interface to the Dataspeed Inc. Drive-By-Wire kits\n  ";
  };
})
