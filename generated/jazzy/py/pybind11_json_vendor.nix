{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pybind11_json-vendor_source-0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702 = substituteSource {
      src = fetchgit {
        name = "pybind11_json-vendor_source-0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702";
        hash = "sha256-GQldzT1YU6I1s1RFfzNIJNaIY/LsrsTevoaUoz1SK+Y=";
      };
      substitutions = [
      ];
    };
    pybind11_json_vendor-21bd9e6509c1d7e65a2876d888ad8a7990a51208 = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-21bd9e6509c1d7e65a2876d888ad8a7990a51208-source";
        url = "https://github.com/ros2-gbp/pybind11_json_vendor-release.git";
        rev = "21bd9e6509c1d7e65a2876d888ad8a7990a51208";
        hash = "sha256-MRTBHHIoxucf4OASlszDZ3LuA0He/SRhobqoNsA8vDo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11_json.git";
          to = "VCS_TYPE path VCS_URL ${pybind11_json-vendor_source-0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_json_vendor";
  version = "0.4.2-1";
  src = sources.pybind11_json_vendor-21bd9e6509c1d7e65a2876d888ad8a7990a51208;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pybind11_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A vendor package for pybind11_json for Modern C++";
  };
}
