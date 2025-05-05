{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ouxt-lint-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sol_vendor";
  version = "0.0.3-5";
  src = finalAttrs.passthru.sources."sol_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sol_vendor" = substituteSource {
      src = fetchgit {
        name = "sol_vendor-source";
        url = "https://github.com/ros2-gbp/sol_vendor-release.git";
        rev = "7032049f388b7782d9c969c8b11371e07c40d61e";
        hash = "sha256-KyC2VV3zPu3hKaonkepXXm9mAKqTakBjLDSdKBEh4Os=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ThePhD/sol2.git";
          to = "URL ${sources."sol_vendor/sol2"}";
        }
      ];
    };
    "sol_vendor/sol2" = substituteSource {
      src = fetchgit {
        name = "sol2-source";
        url = "https://github.com/ThePhD/sol2.git";
        rev = "c1f95a773c6f8f4fde8ca3efe872e7286afe4444";
        hash = "sha256-0q0ew2ql0ED5ynYPQkq4UHq21VjiqSZTg09XsrrBwqI=";
      };
    };
  });
  meta = {
    description = "vendor package for the sol2 library";
  };
})
