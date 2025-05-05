{
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "coal";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."coal";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "boost" "doxygen" "eigen" "git" "liboctomap-dev" "python3" "python3-lxml" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ eigenpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "doxygen" "eigen" "git" "liboctomap-dev" "python3" "python3-lxml" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "coal" = substituteSource {
      src = fetchgit {
        name = "coal-source";
        url = "https://github.com/ros2-gbp/coal-release.git";
        rev = "43a5dd48b315704785ce8fa2b6031cee3771d29d";
        hash = "sha256-klt06os3Y8hiqkw++qE2OSX5PtbPTaIxO6DvLYxwjoM=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
