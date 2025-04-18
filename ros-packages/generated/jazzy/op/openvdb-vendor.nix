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
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."openvdb_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libblosc-dev" "libboost-iostreams-dev" "libboost-thread-dev" "libopenvdb-dev" "tbb" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openvdb_vendor" = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "dcfb0be5293e8246ad203acef0726b74e7b61052";
        hash = "sha256-KIce4PsmhX2f1L+XP1BQ0R3/uIiwj4RmjDsmfIPUJRM=";
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
        rev = "22e71873ffc55c3a6253d31302e4f5e2191f9a0b";
        hash = "sha256-oIJFi4k5oQsz1rce4wyQrPdxEv3NFyLWgaL8MZ/RYRc=";
      };
    };
  });
  meta = {
    description = "Wrapper around OpenVDB, if not found on the system, will compile from source";
  };
})
