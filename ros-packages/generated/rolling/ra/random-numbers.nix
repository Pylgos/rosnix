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
  version = "2.0.2-1";
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
        rev = "b9e33ebbdc441fbd7a995fbc70df5d6a923838b4";
        hash = "sha256-Y/Vwy4Ma3k7fRnUAfzeEfBKbXhBNTmyWtJ5cIGYA0z0=";
      };
    };
  });
  meta = {
    description = "\n  This  library contains wrappers for generating floating point values, integers, quaternions using boost libraries.\n\n  The constructor of the wrapper is guaranteed to be thread safe and initialize its random number generator to a random seed.\n  Seeds are obtained using a separate and different random number generator.\n  ";
  };
})
