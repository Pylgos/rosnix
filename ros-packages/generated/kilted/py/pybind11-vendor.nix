{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pybind11_vendor";
  version = "3.2.0-2";
  src = finalAttrs.passthru.sources."pybind11_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pybind11_vendor" = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "3f469cf2b877384ec887c46e0c13b5c30293af8b";
        hash = "sha256-nF1kYiwA83BPhzft1SdOjAsUFa9GQu0Op6udJwtDK8k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11.git";
          to = "VCS_TYPE path VCS_URL ${sources."pybind11_vendor/pybind11"}";
        }
      ];
    };
    "pybind11_vendor/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around pybind11.\n  ";
  };
})
