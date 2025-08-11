{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canboat_vendor";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."canboat_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canboat_vendor" = substituteSource {
      src = fetchgit {
        name = "canboat_vendor-source";
        url = "https://github.com/ros2-gbp/canboat_vendor-release.git";
        rev = "cf417ae385bf1c7004e81787f2e3df2617d45b29";
        hash = "sha256-EAY1urI69YtnbefgWuflaBJ8P/4nrPk3lBl6so6qMpg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/canboat/canboat.git";
          to = "URL ${sources."canboat_vendor/canboat"}";
        }
      ];
    };
    "canboat_vendor/canboat" = substituteSource {
      src = fetchgit {
        name = "canboat-source";
        url = "https://github.com/canboat/canboat.git";
        rev = "27cc98974fbe05a97175882a50033aca370ea210";
        hash = "sha256-4cFo5tXxoOt1kdhHvFZ0Uzp9wEUwra47rrZggWJoKoI=";
      };
    };
  });
  meta = {
    description = "Thin package wrapper for Canboat";
  };
})
