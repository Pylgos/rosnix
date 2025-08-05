{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robotraconteur,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "robotraconteur_companion";
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."robotraconteur_companion";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ robotraconteur ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libboost-atomic" "libboost-chrono" "libboost-date-time" "libboost-filesystem" "libboost-program-options" "libboost-random" "libboost-regex" "libboost-system" "libboost-thread" "yaml-cpp" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ robotraconteur ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libboost-atomic" "libboost-chrono" "libboost-date-time" "libboost-filesystem" "libboost-program-options" "libboost-random" "libboost-regex" "libboost-system" "libboost-thread" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "robotraconteur_companion" = substituteSource {
      src = fetchgit {
        name = "robotraconteur_companion-source";
        url = "https://github.com/ros2-gbp/robotraconteur_companion-release.git";
        rev = "57731cd4dde07d933a5a062678e3495726691c0a";
        hash = "sha256-4Iu8+ffqgPdPwqOBGGZSxxa9HfSlrR598Iruuou37k4=";
      };
    };
  });
  meta = {
    description = "Robot Raconteur Companion library for C++";
  };
})
