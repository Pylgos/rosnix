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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav_2d_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-msgs nav2-util nav-2d-msgs nav-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_2d_utils" = substituteSource {
      src = fetchgit {
        name = "nav_2d_utils-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "72d4850a7ada4c0659da952dd466ee37913f1e01";
        hash = "sha256-NFFborkxLJ6MVJTvyC2u5dLr6b/pwBEvt9BwjdkTuhc=";
      };
    };
  });
  meta = {
    description = "A handful of useful utility functions for nav_2d packages.";
  };
})
