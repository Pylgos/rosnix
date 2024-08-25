{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3Packages,
  substituteSource,
  tbb,
  zlib,
}:
let
  sources = rec {
    openvdb_vendor = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "f904f841d9710a0eaf891985c5f39aa9fbb335dc";
        hash = "sha256-b8QXIgeHWV4KlUGjnR5jWv2Z4aqMZcBGpWcu27q8jGo=";
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
          to = "VCS_TYPE path VCS_URL ${openvdb_vendor-vendor_source-openvdb-0}";
        }
      ];
    };
    openvdb_vendor-vendor_source-openvdb-0 = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-vendor_source-openvdb-0-source";
        url = "https://github.com/AcademySoftwareFoundation/openvdb.git";
        rev = "ddf922fea94cbf6e96f6277c46c05ff12f22731f";
        hash = "sha256-kaf5gpGYVWinmnRwR/IafE1SJcwmP2psfe/UZdtH1Og=";
      };
      substitutions = [
        {
          path = "nanovdb/nanovdb/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/jpaver/opengametools.git";
          to = "URL ${openvdb_vendor-vendor_source-openvdb-0-vendor_source-opengametools-0}";
        }
      ];
    };
    openvdb_vendor-vendor_source-openvdb-0-vendor_source-opengametools-0 = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-vendor_source-openvdb-0-vendor_source-opengametools-0-source";
        url = "https://github.com/jpaver/opengametools.git";
        rev = "a45c00f7c4ff2e7f750099cba7fcc299e0d08096";
        hash = "sha256-sjFI1al6d8qb11qZautLBM97ovukqCkyNRoB+IeOAcg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openvdb_vendor";
  version = "2.5.0-1";
  src = sources.openvdb_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost tbb zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "libblosc-dev" ];
  meta = {
    description = "Wrapper around OpenVDB, if not found on the system, will compile from source";
  };
}
