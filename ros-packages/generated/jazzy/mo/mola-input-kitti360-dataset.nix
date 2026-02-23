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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."mola_input_kitti360_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti360_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "947fb297a0b0fffa9b88477f224f2535d764cdbf";
        hash = "sha256-XvVp/Usi7fCsWh4MDnvV8TD4oRP4CoShcBsd38GZkgM=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
})
