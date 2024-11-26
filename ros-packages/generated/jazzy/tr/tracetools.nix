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
  version = "8.2.2-1";
  src = finalAttrs.passthru.sources."tracetools";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" "lttng-tools" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools" = substituteSource {
      src = fetchgit {
        name = "tracetools-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "fdd540cbf8e465c0258cb732e3e121c5fd5f9a3f";
        hash = "sha256-7Q5l3XnsaRS3e00Mam1vFw9JGEA6Y1DWFMdVSfPgsL4=";
      };
    };
  });
  meta = {
    description = "Tracing wrapper for ROS 2.";
  };
})
