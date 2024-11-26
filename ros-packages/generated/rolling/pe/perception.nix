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
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."perception";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  passthru = {
    sources = mkSourceSet (sources: {
      "perception" = substituteSource {
        src = fetchgit {
          name = "perception-source";
          url = "https://github.com/ros2-gbp/variants-release.git";
          rev = "39e208b10f4f79977c590de394f89d0a250e7b93";
          hash = "sha256-fzQKQQPxgGVXz2DC/x6GwXS/92T14febq0DyVaD90uo=";
        };
      };
    });
  };
  meta = {
    description = "A package which aggregates common perception packages.";
  };
})
