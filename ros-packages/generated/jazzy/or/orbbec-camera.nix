{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  camera-info-manager,
  cv-bridge,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-publisher,
  image-transport,
  mkSourceSet,
  orbbec-camera-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  statistics-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orbbec_camera";
  version = "2.7.6-1";
  src = finalAttrs.passthru.sources."orbbec_camera";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-lint-auto ament-lint-common backward-ros builtin-interfaces camera-info-manager cv-bridge diagnostic-msgs diagnostic-updater image-publisher image-transport orbbec-camera-msgs rclcpp rclcpp-components sensor-msgs statistics-msgs std-msgs std-srvs tf2 tf2-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgflags-dev" "libgoogle-glog-dev" "libssl-dev" "nlohmann-json-dev" "opengl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp ament-lint-auto ament-lint-common backward-ros builtin-interfaces camera-info-manager cv-bridge diagnostic-msgs diagnostic-updater image-publisher image-transport orbbec-camera-msgs rclcpp rclcpp-components sensor-msgs statistics-msgs std-msgs std-srvs tf2 tf2-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgflags-dev" "libgoogle-glog-dev" "libssl-dev" "nlohmann-json-dev" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "orbbec_camera" = substituteSource {
      src = fetchgit {
        name = "orbbec_camera-source";
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "9c78a4d51d5c82c18f82db1d0f22050e8e432929";
        hash = "sha256-bU7Up6BDJvXXWpua/SxuCTcaFI/9+osmMqPt3ToUS9Q=";
      };
    };
  });
  meta = {
    description = "Orbbec Camera package";
  };
})
