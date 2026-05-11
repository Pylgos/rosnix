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
  version = "9.0.0-1";
  src = finalAttrs.passthru.sources."tracetools";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools" = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "1da093aba7a94f5fcf1845d231cc2e320540c514";
        hash = "sha256-OvCrtOCH5yzFeaCkhHZv0lbvBlDe1m4apVNWK+0fRoI=";
      };
    };
  });
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
})
