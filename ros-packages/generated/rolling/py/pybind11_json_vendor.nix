{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "pybind11_json_vendor" = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_json_vendor-release.git";
        rev = "fb32bb1d43d2b20a025fabcbf0fe1b598a8b27b6";
        hash = "sha256-sBIr8Vv+i2uqAcyEryqSVaPBzxg4WqowzHzeFh1WKgk=";
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
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "pybind11_json_vendor";
  version = "0.5.0-1";
  src = sources."pybind11_json_vendor";
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
