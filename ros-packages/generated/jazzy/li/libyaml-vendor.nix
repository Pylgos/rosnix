{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-vendor-package,
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
  version = "1.6.3-2";
  src = finalAttrs.passthru.sources."libyaml_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libyaml" "libyaml-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libyaml" "libyaml-dev" "pkg-config" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "libyaml_vendor" = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "6716b363b25f6dd62d1d1673537ea10bc9f9c3d8";
        hash = "sha256-B4KqEW6DWzKfnmVCRwlG37WRdC5jasM41pTz21e1of0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/yaml/libyaml.git";
          to = "VCS_TYPE path VCS_URL ${sources."libyaml_vendor/libyaml"}";
        }
      ];
    };
    "libyaml_vendor/libyaml" = substituteSource {
      src = fetchgit {
        name = "libyaml-source";
        url = "https://github.com/yaml/libyaml.git";
        rev = "2c891fc7a770e8ba2fec34fc6b545c672beb37e6";
        hash = "sha256-S7PnooyfyAsIiRAlEPGYkgkVACGaBaCItuqOwrq2+qM=";
      };
    };
  });
  meta = {
    description = "Vendored version of libyaml.";
  };
})
