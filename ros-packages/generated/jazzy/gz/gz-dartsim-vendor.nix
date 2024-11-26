{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_dartsim_vendor";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."gz_dartsim_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "bullet" "eigen" "fmt" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_dartsim_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_dartsim_vendor-source";
          url = "https://github.com/ros2-gbp/gz_dartsim_vendor-release.git";
          rev = "38bdb4c6948952978b640c95beb7b4e8aaea61f3";
          hash = "sha256-M1p+knNPSpbfQpQATwwHo5EqtCKx0Fn9S7rZLTTWICY=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "VCS_URL https://github.com/dartsim/dart.git";
            to = "VCS_TYPE path VCS_URL ${sources."gz_dartsim_vendor/dart"}";
          }
        ];
      };
      "gz_dartsim_vendor/dart" = substituteSource {
        src = fetchgit {
          name = "dart-source";
          url = "https://github.com/dartsim/dart.git";
          rev = "a51e08c210d7892605c6dc0b9ae96fce4446d9fe";
          hash = "sha256-AfKPqUiW6BsM98TIzTY2ZcFP1WvURs8/dGOzanIiB9g=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
})
