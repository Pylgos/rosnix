{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6 = substituteSource {
      src = fetchFromGitHub {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6-source";
        owner = "pybind";
        repo = "pybind11";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    pybind11_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "pybind11_vendor-source";
        owner = "ros2-gbp";
        repo = "pybind11_vendor-release";
        rev = "374bcea4dd3378c52a669b2f975960121e7fe252";
        hash = "sha256-nF1kYiwA83BPhzft1SdOjAsUFa9GQu0Op6udJwtDK8k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11.git";
          to = "VCS_TYPE path VCS_URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_vendor";
  version = "3.2.0-1";
  src = sources.pybind11_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around pybind11.";
  };
}
