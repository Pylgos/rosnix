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
  version = "2.5.5-1";
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
        rev = "c6e44ff54165407a1845e39ff6190782531ce164";
        hash = "sha256-8hKI9sVS7sw8vNy59YihaO0fxibUg65ytht2fuC6OAY=";
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
        rev = "6001be35518aba2065968eeda1cb97278e27d680";
        hash = "sha256-IEskD2TiAw10BtflvKX7tisP1Y63zMHY1PnXlzGqtGY=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around OpenVDB, if not found on the system, will compile from source\n  ";
  };
})
