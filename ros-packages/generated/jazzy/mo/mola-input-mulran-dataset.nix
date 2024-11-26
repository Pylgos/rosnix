{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_mulran_dataset";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_input_mulran_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_input_mulran_dataset" = substituteSource {
        src = fetchgit {
          name = "mola_input_mulran_dataset-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "089f53d54fe23a5eb693cdd245db947953d825a0";
          hash = "sha256-2ABFUsj9nI+pSKPvGHcXQe5ITdJMT4fB0xHsLFVbA5I=";
        };
      };
    });
  };
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
})
