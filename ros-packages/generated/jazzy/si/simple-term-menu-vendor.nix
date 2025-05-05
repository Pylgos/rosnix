{
  ament-cmake,
  ament-cmake-python,
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
  pname = "simple_term_menu_vendor";
  version = "1.5.7-1";
  src = finalAttrs.passthru.sources."simple_term_menu_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "simple_term_menu_vendor" = substituteSource {
      src = fetchgit {
        name = "simple_term_menu_vendor-source";
        url = "https://github.com/clearpath-gbp/simple_term_menu_vendor-release.git";
        rev = "6ab8fbe31338a72360563ee2b2f44ba1512e745d";
        hash = "sha256-toTrUyUqy7ijNOnTyHXXDtn+mvXcO8izZRsbIFv9Szw=";
      };
    };
  });
  meta = {
    description = "A Python package which creates simple interactive menus on the command line.";
  };
})
