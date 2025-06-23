{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  aruco-markers-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_markers";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."aruco_markers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ aruco-markers-msgs cv-bridge geometry-msgs image-transport sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ aruco-markers-msgs cv-bridge geometry-msgs image-transport sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_markers" = substituteSource {
      src = fetchgit {
        name = "aruco_markers-source";
        url = "https://github.com/namo-robotics/aruco_markers-release.git";
        rev = "192efded9733292039a7a14be6b74a40e0f1d1e8";
        hash = "sha256-INUIS5HMQg6/e3heTC7L5WgioD7TFR4YuPXSP3odTME=";
      };
    };
  });
  meta = {
    description = "A ros2 node for detecting aruco markers in camera images";
  };
})
