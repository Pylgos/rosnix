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
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "opengl" "suitesparse" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "libg2o" = substituteSource {
        src = fetchgit {
          name = "libg2o-source";
          url = "https://github.com/ros2-gbp/libg2o-release.git";
          rev = "00c43ed56545d657e65c2d9df7aae526f9624e13";
          hash = "sha256-AzJrNRj+c+u/OLswKvFbPe9agz7fRITYCGNA6rW8/SY=";
        };
      };
    });
  };
  meta = {
    description = "The libg2o library from http://openslam.org/g2o.html";
  };
})
