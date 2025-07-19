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
  version = "0.12.0-2";
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
        rev = "ba41a7ac032f4a41c98be40ad8ade1eae79fee06";
        hash = "sha256-fzQKQQPxgGVXz2DC/x6GwXS/92T14febq0DyVaD90uo=";
      };
    };
  });
  meta = {
    description = "A package which aggregates common perception packages.";
  };
})
