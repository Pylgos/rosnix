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
  version = "8.8.0-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ pybind11-vendor rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblttng-ctl-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ pybind11-vendor rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" "python3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lttngpy" = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "548a71080cfaf68872ae5aa6ea3c71833ce706b2";
        hash = "sha256-BwvqTASxbYg1b1GH8GsuH5nyA7fuY84fGBQTF22sjZw=";
      };
    };
  });
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
