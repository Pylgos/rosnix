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
  version = "3.11.0-1";
  src = finalAttrs.passthru.sources."eigenpy";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "eigen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "python3" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eigenpy" = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "ba4ed18bf7bfe061ba509ae2aad82c12f59561f3";
        hash = "sha256-NjHthqh5V0Bty5GkYfyyF89lTq9Ff4XFa4tBanVdbyE=";
      };
    };
  });
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
