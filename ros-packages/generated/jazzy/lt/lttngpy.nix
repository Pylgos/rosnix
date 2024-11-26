{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lttngpy";
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  propagatedBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "lttngpy" = substituteSource {
        src = fetchgit {
          name = "lttngpy-source";
          url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
          rev = "3df74a6dda3e0f58deee6918f6c31d1d756d1218";
          hash = "sha256-fJy8xdOuJMFOb2j6gqadR1qpL8QU3bIlvPfpMG3Ff9s=";
        };
      };
    });
  };
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
