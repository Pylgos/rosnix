{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_simple_common";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_simple_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_simple_common" = substituteSource {
      src = fetchgit {
        name = "easynav_simple_common-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "83f34d9223351c67c593d97096fc5b75178e7d57";
        hash = "sha256-4yQukeA6xYDuD/fvnmFmbPa0uDBpJ1DSmzkP/hl/HRM=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Common package.";
  };
})
