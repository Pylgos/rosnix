{
  ament-cmake,
  ament-cmake-copyright,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "random_numbers";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."random_numbers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-random" "libboost-random-dev" "libboost-thread" "libboost-thread-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-random" "libboost-random-dev" "libboost-thread" "libboost-thread-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "random_numbers" = substituteSource {
      src = fetchgit {
        name = "random_numbers-source";
        url = "https://github.com/ros2-gbp/random_numbers-release.git";
        rev = "5ec80697854141a9bf6859aef2c2a9cccb5dc69f";
        hash = "sha256-uWaMR7VdUqK4r3mm2t8wZZY+yoDl/6FL1I94j1Lg0ZY=";
      };
    };
  });
  meta = {
    description = "\n  This  library contains wrappers for generating floating point values, integers, quaternions using boost libraries.\n\n  The constructor of the wrapper is guaranteed to be thread safe and initialize its random number generator to a random seed.\n  Seeds are obtained using a separate and different random number generator.\n  ";
  };
})
