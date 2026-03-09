{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "sdformat_test_files";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."sdformat_test_files";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_test_files" = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "770509f760538d032afd6151d4fe08a39741279f";
        hash = "sha256-MLyyavg80dGr2k8xka7oVKRmrCDmOtcu3y/AsdJmIP4=";
      };
    };
  });
  meta = {
    description = "\n    Example SDFormat XML files for testing tools using hthis format.\n  ";
  };
})
