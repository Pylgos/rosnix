{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "toppra";
  version = "0.6.8-1";
  src = finalAttrs.passthru.sources."toppra";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "toppra" = substituteSource {
      src = fetchgit {
        name = "toppra-source";
        url = "https://github.com/ros2-gbp/toppra-release.git";
        rev = "e8a4accfd0dbaffc7ab78cef98f1c635798d2849";
        hash = "sha256-YFk6kazhzrnV7qvyYxBidoIWIAAMuy8xLwSVpmHNrco=";
      };
    };
  });
  meta = {
    description = "Time-Optimal Path Parameterization";
  };
})
