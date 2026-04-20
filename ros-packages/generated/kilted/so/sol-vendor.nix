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
        rev = "89fc6c929d2ae1e4817b50134039e9afe09745ab";
        hash = "sha256-Emz+WbD1f/ZjNKqaAetVonSfn2LP2pNftxO3qQ6FrpY=";
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
      substitutions = [
        {
          path = "cmake/Packages/FindKaguyaBuild.cmake";
          from = "GIT_REPOSITORY https://github.com/satoren/kaguya.git";
          to = "URL ${sources."sol_vendor/sol2/kaguya"}";
        }
      ];
    };
    "sol_vendor/sol2/kaguya" = substituteSource {
      src = fetchgit {
        name = "kaguya-source";
        url = "https://github.com/satoren/kaguya.git";
        rev = "666d4603d5b70424e8756a5dac05f9abb81ddade";
        hash = "sha256-6eUPgqgRoaopcy+RQ+thdiXnwV2D1FFZMmNpIwaBnMY=";
      };
    };
  });
  meta = {
    description = "vendor package for the sol2 library";
  };
})
