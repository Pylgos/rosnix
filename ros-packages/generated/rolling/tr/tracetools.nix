{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
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
  version = "8.4.1-1";
  src = finalAttrs.passthru.sources."tracetools";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools" = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "ef007d89e7e774278bf98721d6b176323e8c6ad9";
        hash = "sha256-eF/oCAbVCcpT+KAd2xCf/qKNcH3iMgBl9520yR1BJ/Q=";
      };
    };
  });
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
})
