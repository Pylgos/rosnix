{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pybind11_json_vendor";
  version = "0.4.2-1";
  src = finalAttrs.passthru.sources."pybind11_json_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ pybind11-vendor ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pybind11_json_vendor" = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_json_vendor-release.git";
        rev = "21bd9e6509c1d7e65a2876d888ad8a7990a51208";
        hash = "sha256-MRTBHHIoxucf4OASlszDZ3LuA0He/SRhobqoNsA8vDo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11_json.git";
          to = "VCS_TYPE path VCS_URL ${sources."pybind11_json_vendor/pybind11_json"}";
        }
      ];
    };
    "pybind11_json_vendor/pybind11_json" = substituteSource {
      src = fetchgit {
        name = "pybind11_json-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702";
        hash = "sha256-GQldzT1YU6I1s1RFfzNIJNaIY/LsrsTevoaUoz1SK+Y=";
      };
    };
  });
  meta = {
    description = "A vendor package for pybind11_json for Modern C++";
  };
})
