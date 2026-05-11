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
  version = "1.9.0-1";
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
        rev = "d837d8389611091aa8ed7864d046f51ce4dc9fdb";
        hash = "sha256-hQ7gDQm//6sOOcJJ4N1erv57Kkzifj0X1ITwdigutFs=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find libyaml.";
  };
})
