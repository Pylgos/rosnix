{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-yaml,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_kernel";
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_kernel";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_kernel" = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ac0cc9494a641e98378b79c3be6bb7cb44ea1859";
        hash = "sha256-JPqV8fbNtNFdAeE0G4qkdi+bxdJM1Prz5YBLkf7YBfE=";
      };
    };
  });
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
})
