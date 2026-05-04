{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-common,
  image-pipeline,
  image-transport-plugins,
  laser-filters,
  laser-geometry,
  mkSourceSet,
  perception-pcl,
  ros-base,
  rosSystemPackages,
  substituteSource,
  vision-opencv,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "perception";
  version = "0.13.0-2";
  src = finalAttrs.passthru.sources."perception";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  passthru.sources = mkSourceSet (sources: {
    "perception" = substituteSource {
      src = fetchgit {
        name = "perception-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "3fa03b1e690f40a61f8fb0250a003805869b90b0";
        hash = "sha256-075/P1kIVU7y5dOjarS0UbGqDFmBpRsJgKd90mhSMLc=";
      };
    };
  });
  meta = {
    description = "A package which aggregates common perception packages.";
  };
})
