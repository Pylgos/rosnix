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
  version = "3.8.2-1";
  src = finalAttrs.passthru.sources."eigenpy";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" "python3-numpy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "python3" "python3-scipy" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "eigenpy" = substituteSource {
        src = fetchgit {
          name = "eigenpy-source";
          url = "https://github.com/ros2-gbp/eigenpy-release.git";
          rev = "a7fcfca7312d7d98686fce1b2b23b9b5af161e46";
          hash = "sha256-SjF0ivZjk1x6wk3jjCcgoenV6ZIsE6PF1YxvNwIFVVo=";
        };
      };
    });
  };
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
