{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    openvdb_vendor = substituteSource {
      src = fetchgit {
        name = "openvdb_vendor-source";
        url = "https://github.com/SteveMacenski/spatio_temporal_voxel_layer-release.git";
        rev = "0b03bd682394a382754e396f31b0fa117bd26d71";
        hash = "sha256-+hS4Rke9zP2HolcnMjcA0b7z7S0A+J6JZwrCeBvUyUg=";
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
        rev = "1c185fe9ce7217df814ec51482a030d7aa66324d";
        hash = "sha256-euwKNvpVfhtB8hxVHTcetK5iUhSyADxpVtLAEZOiYWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openvdb_vendor";
  version = "2.5.2-1";
  src = sources.openvdb_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libblosc-dev" "libboost-iostreams-dev" "libboost-thread-dev" "libopenvdb-dev" "tbb" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around OpenVDB, if not found on the system, will compile from source";
  };
}
