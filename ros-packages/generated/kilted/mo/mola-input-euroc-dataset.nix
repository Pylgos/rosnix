{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmath,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_euroc_dataset";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_euroc_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_euroc_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "3c6083b517fc89d6dbd7d0efec5883bbc6846e15";
        hash = "sha256-zgMvFQz7yWMG3Sy4pwAFaJAA5xwoEryjLMjhrZ8NK4Q=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
})
