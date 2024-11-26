{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_description";
  version = "2.0.3-3";
  src = finalAttrs.passthru.sources."velodyne_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_description" = substituteSource {
      src = fetchgit {
        name = "velodyne_description-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "8a50bb988e62803eec12aa93c76b0927a2b3f0b8";
        hash = "sha256-vYig3j3DqPeSuEmGlDfvaH64IGdK8x/Yxx40R/Sv5j4=";
      };
    };
  });
  meta = {
    description = "URDF and meshes describing Velodyne laser scanners.";
  };
})
