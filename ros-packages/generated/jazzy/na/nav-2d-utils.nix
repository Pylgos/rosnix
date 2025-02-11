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
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav_2d_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-msgs nav2-util nav-2d-msgs nav-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_2d_utils" = substituteSource {
      src = fetchgit {
        name = "nav_2d_utils-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8925a291332526a1ae3c2d0bf8406869995b427c";
        hash = "sha256-k5rL2g24lrkjj+Q7t2NAH3dS1RXAAXpB//sL8UQRzhI=";
      };
    };
  });
  meta = {
    description = "A handful of useful utility functions for nav_2d packages.";
  };
})
