{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "libg2o";
  version = "2020.5.29-6";
  src = finalAttrs.passthru.sources."libg2o";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libg2o" = substituteSource {
      src = fetchgit {
        name = "libg2o-source";
        url = "https://github.com/ros2-gbp/libg2o-release.git";
        rev = "86c0c222c4db2efe5d3d88735f9b3890a02ae9e6";
        hash = "sha256-Q01oww+xvBRuqbXys1eeHXxevcf515ftVYB+7M845oU=";
      };
    };
  });
  meta = {
    description = "\n    The libg2o library from http://openslam.org/g2o.html\n  ";
  };
})
