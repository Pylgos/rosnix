{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "eigenpy";
  version = "3.10.3-1";
  src = finalAttrs.passthru.sources."eigenpy";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "python3" "python3-numpy" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eigenpy" = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "1d4119ea4d51612cd3ea4cd2ce6494084e33fbbe";
        hash = "sha256-dYKkoFlYCOfJRkkIy+oVrV1YL6p1RZC1oTmVnuDPFlk=";
      };
    };
  });
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
