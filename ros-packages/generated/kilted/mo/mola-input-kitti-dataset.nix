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
  version = "2.0.0-1";
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
        rev = "7dc509bc12fdf79154291f8210f1feaff1357aef";
        hash = "sha256-GdK3pCAs1cegcdl3hkdzARM46jjnnX4opEKNfgGiiG4=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
})
