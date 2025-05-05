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
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."sdformat_test_files";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_test_files" = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "065a5a0dd7475b2a2b143a4e7c62af270f672ceb";
        hash = "sha256-+OOpBAUO+g0O8UYgUSQRn8TIzn3Zyi//hG89iyzKo8U=";
      };
    };
  });
  meta = {
    description = "\n    Example SDFormat XML files for testing tools using hthis format.\n  ";
  };
})
