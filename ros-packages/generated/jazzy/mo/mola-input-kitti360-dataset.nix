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
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."mola_input_kitti360_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti360_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "d9cef563c3a904146b8c57bcea04074aafb046c8";
        hash = "sha256-s4qOqTiRSXW1Sf/oaRTscq8Qc4pPBJLmNsTX8mbLQAw=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
})
