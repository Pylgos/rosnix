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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_mulran_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_mulran_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "bb74ebc1516bb53cec446d3a325ba7f693eb9eed";
        hash = "sha256-U1WD4fJMunm07KYfzTk9b3Nkoi16MpLK9bHrfMJvlcg=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
})
