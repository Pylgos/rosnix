{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_core";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."navmap_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "navmap_core" = substituteSource {
      src = fetchgit {
        name = "navmap_core-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "cddad37cfb9271323b544d915f4bf07102ae80bc";
        hash = "sha256-0kAMMMjrQWqz8pm56mR9mSfoFI37XdCD8ArlAgwWCyE=";
      };
    };
  });
  meta = {
    description = "Core C++ library for NavMap.";
  };
})
