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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."sdformat_test_files";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sdformat_test_files" = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "395e2afa02306e3b9908ffdfcf50e381047cd1fa";
        hash = "sha256-9ax58Tp+rJn34Q+9yLCk2F9wGEzChcJgnDpiDXB3rzA=";
      };
    };
  });
  meta = {
    description = "\n    Example SDFormat XML files for testing tools using hthis format.\n  ";
  };
})
