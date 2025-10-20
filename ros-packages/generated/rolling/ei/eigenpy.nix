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
  version = "3.12.0-1";
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
        rev = "f63112b070c62b055b6d7aa03e956871f3d768b9";
        hash = "sha256-Gbl4wX3MmUVElx/4oqz0VwMIz/kQ7xWpfrPZ9aim/kE=";
      };
    };
  });
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
