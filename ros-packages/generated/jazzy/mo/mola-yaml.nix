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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_yaml";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mrpt-libbase ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libbase ];
  passthru.sources = mkSourceSet (sources: {
    "mola_yaml" = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6fa1d80109cc37ded0fa6bc34a6bc115806d89ef";
        hash = "sha256-+7i+8INkTg/i+yOAQJouA6qUcPfYVF3GiluzRy4c8i4=";
      };
    };
  });
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
})
