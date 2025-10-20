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
  version = "3.0.2-1";
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
        rev = "4af082ca51394afabdefca56656150da5e05781a";
        hash = "sha256-SyBS3IyEAsE/NP/TPt+XzrfGk/UdqTmtr8TGbL/6w10=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
