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
        rev = "db5060f672638acd7b275ce0fa36ce5c036bbd85";
        hash = "sha256-+ifIf0+UyV5OYCyNzeuX0TzPoQa6a1z35IiReQYLYa0=";
      };
    };
  });
  meta = {
    description = "\n    The libg2o library from http://openslam.org/g2o.html\n  ";
  };
})
