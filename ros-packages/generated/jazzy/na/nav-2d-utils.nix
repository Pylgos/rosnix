{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav_2d_utils";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav_2d_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-msgs nav2-util nav-2d-msgs nav-msgs std-msgs tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-msgs nav2-util nav-2d-msgs nav-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_2d_utils" = substituteSource {
      src = fetchgit {
        name = "nav_2d_utils-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8ed1b30f0aba954b6e3193b7f6614150eda0011f";
        hash = "sha256-1vfDYB4JIZTa7w/XeQMl5GzW0KqRTZQ8yZgVEDEFZoM=";
      };
    };
  });
  meta = {
    description = "A handful of useful utility functions for nav_2d packages.";
  };
})
