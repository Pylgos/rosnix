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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" "python3-scipy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "git" "python3" "python3-numpy" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eigenpy" = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "8becae1afc147c1e87921f8c7031ea24953a72d5";
        hash = "sha256-NjHthqh5V0Bty5GkYfyyF89lTq9Ff4XFa4tBanVdbyE=";
      };
    };
  });
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
