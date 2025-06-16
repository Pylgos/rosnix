{
  ament-cmake,
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
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."aruco_markers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ aruco-markers-msgs cv-bridge geometry-msgs image-transport sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ aruco-markers-msgs cv-bridge geometry-msgs image-transport sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_markers" = substituteSource {
      src = fetchgit {
        name = "aruco_markers-source";
        url = "https://github.com/namo-robotics/aruco_markers-release.git";
        rev = "ec29d89bba711e253703c46bc66603a129428915";
        hash = "sha256-10/nROvoWor10hzWQbcocyaySIz3R2uFh7P6VDIb+zI=";
      };
    };
  });
  meta = {
    description = "A ros2 node for detecting aruco markers in camera images";
  };
})
