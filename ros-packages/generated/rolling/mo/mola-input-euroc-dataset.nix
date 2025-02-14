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
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."mola_input_euroc_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_euroc_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "33713202153ff4537e4dd8d190954ffc87ebaa88";
        hash = "sha256-KPgvBSXOSEQm8+LGbPZEHpwj3P/SQSLAYZHG0MQMJKk=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
})
