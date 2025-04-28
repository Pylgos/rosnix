{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tracetools";
  version = "8.7.0-1";
  src = finalAttrs.passthru.sources."tracetools";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools" = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "70860a944b6ef23b459618b2d8e24fd2468a0a10";
        hash = "sha256-LHIMzb+iYNrAtZWapQqGTsp2v09PrEKRbKbobgi0EeU=";
      };
    };
  });
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
})
