{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libyaml_vendor";
  version = "1.8.1-2";
  src = finalAttrs.passthru.sources."libyaml_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libyaml-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libyaml-dev" "pkg-config" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libyaml-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libyaml_vendor" = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "3e57cc6795f73bd4535a7b5add02c588b02d5f10";
        hash = "sha256-P4rmXlIfYf1SvMrf7ytJThMF5XxO1mcUosIObp4j5qA=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find libyaml.";
  };
})
