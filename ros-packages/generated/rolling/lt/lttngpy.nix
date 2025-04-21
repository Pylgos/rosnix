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
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lttngpy";
  version = "8.6.0-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lttngpy" = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "f37bfa2364befd0e7f09ea171cfd5615a1046b30";
        hash = "sha256-LynfnWz2vKa/YcIxjIxk6eB0YTkmv4n5n8vV8t7dNpo=";
      };
    };
  });
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
