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
  version = "0.0.3-4";
  src = finalAttrs.passthru.sources."canboat_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canboat_vendor" = substituteSource {
      src = fetchgit {
        name = "canboat_vendor-source";
        url = "https://github.com/ros2-gbp/canboat_vendor-release.git";
        rev = "03f8c9fbe42e3b032e8ccd51ca5be1fa1dc680d3";
        hash = "sha256-2eMPRK5rG86HIQcXn6I5zJkHIEwPocspNpb8PjtZgdI=";
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
