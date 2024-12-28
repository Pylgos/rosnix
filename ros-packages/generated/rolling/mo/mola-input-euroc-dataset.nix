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
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."mola_input_euroc_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_euroc_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "1b50374621baea529b4879441fa77707d78c35ca";
        hash = "sha256-ONhdtU3T0xw8ysv+W016ZEt4FQMPNLvkh/hTMFZthC8=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
})
