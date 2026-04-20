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
  version = "0.2.1-2";
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
        rev = "d538dddd65dc83080faa730e6df91bea40692e15";
        hash = "sha256-1A4axOAsRQDiV1g2y2Is5NbtU5Qldrim82r9h0JmlAQ=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Common package.";
  };
})
