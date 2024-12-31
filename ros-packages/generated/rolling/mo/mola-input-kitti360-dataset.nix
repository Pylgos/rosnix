{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_kitti360_dataset";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_input_kitti360_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti360_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "91a8be1b83c7a33ad9456d04910298a37f0791f4";
        hash = "sha256-HUMpYA/IOoEez7z3Y50gRWdhTXw6MpDWqFXtCNdnZ4s=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
})
