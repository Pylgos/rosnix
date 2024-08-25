{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-5 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-5-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    pybind11_vendor = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "374bcea4dd3378c52a669b2f975960121e7fe252";
        hash = "sha256-nF1kYiwA83BPhzft1SdOjAsUFa9GQu0Op6udJwtDK8k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11.git";
          to = "VCS_TYPE path VCS_URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-5}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_vendor";
  version = "3.2.0-1";
  src = sources.pybind11_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pybind11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around pybind11.";
  };
}
