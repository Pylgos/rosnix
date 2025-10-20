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
        rev = "acaa48c3e75f93d25abfd8e2cb78d25558d0cc8f";
        hash = "sha256-Gbl4wX3MmUVElx/4oqz0VwMIz/kQ7xWpfrPZ9aim/kE=";
      };
    };
  });
  meta = {
    description = "Bindings between Numpy and Eigen using Boost.Python";
  };
})
