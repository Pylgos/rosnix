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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_mulran_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_mulran_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "0050bbc90c558022406e6974ddfd313d45ed14fb";
        hash = "sha256-Hi4GqdBeapCAeYJpYEEHPpGwPG6nMI42dpyNEwoaO68=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
})
