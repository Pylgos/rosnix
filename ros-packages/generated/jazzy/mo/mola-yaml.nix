{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libbase,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_yaml";
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."mola_yaml";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libbase ];
  passthru.sources = mkSourceSet (sources: {
    "mola_yaml" = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "030558a64de3c02f983674cc66aff5f51180f045";
        hash = "sha256-gZ05z5TQmMi1AfKiks8QD/ElmWftceXxhGSoqvBzoQA=";
      };
    };
  });
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})
