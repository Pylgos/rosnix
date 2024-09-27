{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841 = substituteSource {
      src = fetchgit {
        name = "pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    pybind11_vendor-374bcea4dd3378c52a669b2f975960121e7fe252 = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-374bcea4dd3378c52a669b2f975960121e7fe252-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "374bcea4dd3378c52a669b2f975960121e7fe252";
        hash = "sha256-nF1kYiwA83BPhzft1SdOjAsUFa9GQu0Op6udJwtDK8k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11.git";
          to = "VCS_TYPE path VCS_URL ${pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_vendor";
  version = "3.2.0-1";
  src = sources.pybind11_vendor-374bcea4dd3378c52a669b2f975960121e7fe252;
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
