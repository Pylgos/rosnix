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
  pname = "mola_input_kitti_dataset";
  version = "2.7.0-1";
  src = finalAttrs.passthru.sources."mola_input_kitti_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_kitti_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "118566a83054e4d6c81f92cfd4c02224f93b85ef";
        hash = "sha256-FwC0wIgi5feqMLoGXeISD5gz5XFfUjj6arbbJEesH7g=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
