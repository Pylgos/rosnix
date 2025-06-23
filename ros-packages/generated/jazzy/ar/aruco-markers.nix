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
  version = "0.0.2-1";
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
        rev = "edbdc6d22757b37d4f4549001e11f7223cc5afc7";
        hash = "sha256-WDDhRXCQPQWW4yB4M5rhzXZXjbYbW96tzWVN6Vr0WcA=";
      };
    };
  });
  meta = {
    description = "A ros2 node for detecting aruco markers in camera images";
  };
})
