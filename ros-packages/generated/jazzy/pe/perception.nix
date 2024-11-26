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
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."perception";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ];
  passthru = {
    sources = mkSourceSet (sources: {
      "perception" = substituteSource {
        src = fetchgit {
          name = "perception-source";
          url = "https://github.com/ros2-gbp/variants-release.git";
          rev = "3e52d9c0398d0dc8fd4c9fb231aa929fcd3b0a27";
          hash = "sha256-dm1psyuV0pFw4lLrVBcz/ElZ/T+49Lqaf1kDqahOvLs=";
        };
      };
    });
  };
  meta = {
    description = "A package which aggregates common perception packages.";
  };
})
