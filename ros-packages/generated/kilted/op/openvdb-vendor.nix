{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "openvdb_vendor";
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."openvdb_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libblosc-dev" "libboost-iostreams-dev" "libboost-thread-dev" "libopenvdb-dev" "tbb" "zlib" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libblosc-dev" "libboost-iostreams-dev" "libboost-thread-dev" "libopenvdb-dev" "tbb" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openvdb_vendor" = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "20b7180d69ade192f8c3d107de6803c41e7a8908";
        hash = "sha256-ci0AQn3NcxTwMC/ltRWHYHTDu13bLHGzxumqoaKWaD8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/AcademySoftwareFoundation/openvdb.git";
          to = "VCS_TYPE path VCS_URL ${sources."openvdb_vendor/openvdb"}";
        }
      ];
    };
    "openvdb_vendor/openvdb" = substituteSource {
      src = fetchgit {
        name = "openvdb-source";
        url = "https://github.com/AcademySoftwareFoundation/openvdb.git";
        rev = "ddf922fea94cbf6e96f6277c46c05ff12f22731f";
        hash = "sha256-kaf5gpGYVWinmnRwR/IafE1SJcwmP2psfe/UZdtH1Og=";
      };
      substitutions = [
        {
          path = "nanovdb/nanovdb/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/jpaver/opengametools.git";
          to = "URL ${sources."openvdb_vendor/openvdb/opengametools"}";
        }
      ];
    };
    "openvdb_vendor/openvdb/opengametools" = substituteSource {
      src = fetchgit {
        name = "opengametools-source";
        url = "https://github.com/jpaver/opengametools.git";
        rev = "0dce3f2277a32b9f646367139506b00da6f080d7";
        hash = "sha256-1cc/cAutUApnaRhKFoqpvrgFl6wUpU8A3E+K5mVInVQ=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around OpenVDB, if not found on the system, will compile from source\n  ";
  };
})
