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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_input_mulran_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_mulran_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "de18412415ed61f334cb617d8ac6c87afe4a07b2";
        hash = "sha256-bpi2b+SH8KgOUkRmVvAZzcPyPlq23tMRRa1jcVUd8f0=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
})
