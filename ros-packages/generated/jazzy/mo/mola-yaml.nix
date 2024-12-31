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
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_yaml";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libbase ];
  passthru.sources = mkSourceSet (sources: {
    "mola_yaml" = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0961f8183d40c48e1ecc2ad8e6bab3d155bff81b";
        hash = "sha256-J5tXpUMMgeHRDsOIVl6ATdaAqpkYU5jY60zvTDqGrz0=";
      };
    };
  });
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})
