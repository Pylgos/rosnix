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
  version = "3.0.2-2";
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
        rev = "b2aa79fce532c733681dc6a404d655ab599ce75b";
        hash = "sha256-WEkoGL4UY2YJf61qoK1040FY2VbJbgEOP+tkR5RH5JU=";
      };
    };
  });
  meta = {
    description = "An extension of the Flexible Collision Library.";
  };
})
