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
  version = "8.5.0-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ pybind11-vendor rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lttngpy" = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "3b262bcad659e004c94d735a817e53060843f60a";
        hash = "sha256-Dbv3odiBCZ/kf9HS4MjcZjEp+avhgHwfTHz4cYd0V0o=";
      };
    };
  });
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
