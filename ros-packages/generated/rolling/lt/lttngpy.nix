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
  rosSystemPackages,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lttngpy";
  version = "8.9.0-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblttng-ctl-dev" "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lttngpy" = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "54ade2a029d9c79020d84c79fa8f282003b272c6";
        hash = "sha256-qDfWoRNf7eakiJkuPOUm63Q714tY4hddu9y/AqJzC8o=";
      };
    };
  });
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
