{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-continental,
  nebula-hesai,
  nebula-robosense,
  nebula-velodyne,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nebula-continental nebula-hesai nebula-robosense nebula-velodyne ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nebula-continental nebula-hesai nebula-robosense nebula-velodyne ];
  passthru.sources = mkSourceSet (sources: {
    "nebula" = substituteSource {
      src = fetchgit {
        name = "nebula-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "f4b72f1aa6f170aee5e92a1cbdd34a3530206829";
        hash = "sha256-2RciQAD1TBYCdbqPBSnPVCxVJqLVjaUSoaItAKO5EZQ=";
      };
    };
  });
  meta = {
    description = "Nebula: multi-vendor LiDAR and radar driver";
  };
})
