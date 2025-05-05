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
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."gz_dartsim_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "bullet" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "gz_dartsim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_dartsim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_dartsim_vendor-release.git";
        rev = "b155efdf267f7bfe39e23add87ad324a69c99f70";
        hash = "sha256-B6QSeeHCwixbeQXeGfaOBZ3mCQ4o3ulgkfqtq/l2P34=";
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
  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
  };
})
