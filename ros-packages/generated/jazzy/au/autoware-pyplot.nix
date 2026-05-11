{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_pyplot";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_pyplot";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-matplotlib" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-matplotlib" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_pyplot" = substituteSource {
      src = fetchgit {
        name = "autoware_pyplot-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "0ca370e196ce9f6fa470515eb92a9c2802d56292";
        hash = "sha256-w08WhwJ6XiSgQUFjxVxxq3FoM4wd88LT7IPVdtxEO2Y=";
      };
    };
  });
  meta = {
    description = "C++ interface for matplotlib based on pybind11";
  };
})
