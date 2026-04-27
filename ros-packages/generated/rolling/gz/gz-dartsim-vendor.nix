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
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."gz_dartsim_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "bullet" "eigen" "fmt" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liboctomap-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "bullet" "eigen" "fmt" "libboost-dev" "libboost-regex-dev" "libboost-system-dev" "libccd-dev" "libfcl-dev" "liboctomap-dev" "liburdfdom-dev" "lz4" "opende" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "gz_dartsim_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_dartsim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_dartsim_vendor-release.git";
        rev = "04e1d0760ae973895364f72ff06a7d199434725f";
        hash = "sha256-sjSBMSDJoh5XO5UjtwYrSbz3afMTb6RW0z0gnfX7APA=";
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
        rev = "5295704377b36251670681ea0e94cfab8e3fcfc9";
        hash = "sha256-4O5FaOG0J2DaHQ/Idt6DBhQkNqocL70ZC1MQEfoElCM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for the DART physics engine v6.16.6\n  ";
  };
})
