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
  version = "8.2.5-1";
  src = finalAttrs.passthru.sources."lttngpy";
  nativeBuildInputs = [ ament-cmake python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ pybind11-vendor rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblttng-ctl-dev" ]; };
  buildInputs = [ ament-cmake python-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ pybind11-vendor rpyutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ctl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lttngpy" = substituteSource {
      src = fetchgit {
        name = "lttngpy-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "22a2930d83e7d49a57f9693fd45db28de8acb9f0";
        hash = "sha256-DMbpwhqZpyhvvBla5RUzAgIMyt6xu2hKntmGoiIxKEk=";
      };
    };
  });
  meta = {
    description = "liblttng-ctl Python bindings";
  };
})
