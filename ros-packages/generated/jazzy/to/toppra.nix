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
  version = "0.6.7-1";
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
        rev = "12e0474fd34cc1830a0055b57b9afe2ba05125cf";
        hash = "sha256-2m7bs1A/6BI4AuadfySiMkfT23eZE/msNuMDQLpYPnE=";
      };
    };
  });
  meta = {
    description = "Time-Optimal Path Parameterization";
  };
})
