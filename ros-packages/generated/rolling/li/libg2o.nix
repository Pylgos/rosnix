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
  version = "2020.5.29-5";
  src = finalAttrs.passthru.sources."libg2o";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libg2o" = substituteSource {
      src = fetchgit {
        name = "libg2o-source";
        url = "https://github.com/ros2-gbp/libg2o-release.git";
        rev = "c30a14c800c9142b73205fd6c67827fab5295326";
        hash = "sha256-2CMfNQ2nQezvsaS7kSEUvwkCtBZcnoOPaqOljhsfHFc=";
      };
    };
  });
  meta = {
    description = "The libg2o library from http://openslam.org/g2o.html";
  };
})
