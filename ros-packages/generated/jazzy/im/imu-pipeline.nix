{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-processors,
  imu-transformer,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_pipeline";
  version = "0.5.0-3";
  src = finalAttrs.passthru.sources."imu_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-processors imu-transformer ];
  passthru.sources = mkSourceSet (sources: {
    "imu_pipeline" = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "97bb02692bfea574dd283391bd56ec611cd8fd70";
        hash = "sha256-dJGjG62iCrupov3xWznx6yfooP5Q5w6rg7pfsX1P9x0=";
      };
    };
  });
  meta = {
    description = "imu_pipeline";
  };
})
