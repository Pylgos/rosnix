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
    pybind11_vendor-6551cb9a99f0e0bb3666b9a9d3b2bda0b598c167 = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-6551cb9a99f0e0bb3666b9a9d3b2bda0b598c167-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "6551cb9a99f0e0bb3666b9a9d3b2bda0b598c167";
        hash = "sha256-IqvDvVq5oLGYddeKV7uYtjHnf3SS24Ji+DO4Wua7xbU=";
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
  version = "3.1.2-2";
  src = sources.pybind11_vendor-6551cb9a99f0e0bb3666b9a9d3b2bda0b598c167;
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
