{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  aruco,
  aruco-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_ros";
  version = "5.0.5-1";
  src = finalAttrs.passthru.sources."aruco_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ aruco aruco-msgs cv-bridge geometry-msgs image-transport rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_ros" = substituteSource {
      src = fetchgit {
        name = "aruco_ros-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "6a254acadd05ba78a14ddb800009dd556ab09508";
        hash = "sha256-LIF5MiASkw9eXs5hNg5L1VAmICC588FpCYYSOHAjZjU=";
      };
    };
  });
  meta = {
    description = "The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain). It provides real-time marker based 3D pose estimation using AR markers.";
  };
})
