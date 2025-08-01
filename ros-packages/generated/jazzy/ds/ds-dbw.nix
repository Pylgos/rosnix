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
  version = "2.3.5-1";
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
        rev = "b0e2a607412fce80f035610eba0241aa3055c67e";
        hash = "sha256-xKfyYawbqMBFIrreGdv0An/3Qp736f4Aw0AW1qWYDpk=";
      };
    };
  });
  meta = {
    description = "\n    Interface to the Dataspeed Inc. Drive-By-Wire kits\n  ";
  };
})
