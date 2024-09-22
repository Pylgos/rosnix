{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pybind11_json_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "pybind11_json_vendor-source";
        owner = "ros2-gbp";
        repo = "pybind11_json_vendor-release";
        rev = "fb32bb1d43d2b20a025fabcbf0fe1b598a8b27b6";
        hash = "sha256-sBIr8Vv+i2uqAcyEryqSVaPBzxg4WqowzHzeFh1WKgk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11_json.git";
          to = "VCS_TYPE path VCS_URL ${pybind11_json_vendor-vendor_source-pybind11_json-0}";
        }
      ];
    };
    pybind11_json_vendor-vendor_source-pybind11_json-0 = substituteSource {
      src = fetchFromGitHub {
        name = "pybind11_json_vendor-vendor_source-pybind11_json-0-source";
        owner = "pybind";
        repo = "pybind11_json";
        rev = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702";
        hash = "sha256-GQldzT1YU6I1s1RFfzNIJNaIY/LsrsTevoaUoz1SK+Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_json_vendor";
  version = "0.5.0-1";
  src = sources.pybind11_json_vendor;
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
