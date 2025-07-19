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
  version = "3.0.1-2";
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
        rev = "f69f98cfcb87b1e893c30b139403ab68aed6c13f";
        hash = "sha256-jMwbCtc0+cBRjR1SdSTA3ew6lO11DTr97Pc4olBNTFo=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
