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
    libcaer-vendor_source-8710e73ceb21d9fb4f74ead62ca3fae42d828997 = substituteSource {
      src = fetchgit {
        name = "libcaer-vendor_source-8710e73ceb21d9fb4f74ead62ca3fae42d828997-source";
        url = "https://gitlab.com/inivation/dv/libcaer.git";
        rev = "8710e73ceb21d9fb4f74ead62ca3fae42d828997";
        hash = "sha256-aTQw4K7otT7MP6qNediqzgjqbM6Wldg6bzwBTzX34II=";
      };
      substitutions = [
      ];
    };
    libcaer_vendor-541500c206151a84a4b2e6c8fc6503690077a69f = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-541500c206151a84a4b2e6c8fc6503690077a69f-source";
        url = "https://github.com/ros2-gbp/libcaer_vendor-release.git";
        rev = "541500c206151a84a4b2e6c8fc6503690077a69f";
        hash = "sha256-fDxW11ZhQAi6qpSKwjncCFExfZHu7Sq7f0nJem2O2ic=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://gitlab.com/inivation/dv/libcaer.git";
          to = "VCS_TYPE path VCS_URL ${libcaer-vendor_source-8710e73ceb21d9fb4f74ead62ca3fae42d828997}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer_vendor";
  version = "1.0.0-1";
  src = sources.libcaer_vendor-541500c206151a84a4b2e6c8fc6503690077a69f;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Wrapper around libcaer library";
  };
}
