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
        rev = "43bfe2853e2c181d8c885e9d5df46ed48e4fc79b";
        hash = "sha256-gZ05z5TQmMi1AfKiks8QD/ElmWftceXxhGSoqvBzoQA=";
      };
    };
  });
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})
