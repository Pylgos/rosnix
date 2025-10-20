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
  tf2-eigen,
  tf2-msgs,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orbbec_camera";
  version = "1.5.14-1";
  src = finalAttrs.passthru.sources."orbbec_camera";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-lint-auto ament-lint-common backward-ros builtin-interfaces camera-info-manager cv-bridge diagnostic-msgs diagnostic-updater image-publisher image-transport orbbec-camera-msgs rclcpp rclcpp-components sensor-msgs statistics-msgs std-msgs std-srvs tf2 tf2-eigen tf2-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libdw-dev" "libgflags-dev" "libgoogle-glog-dev" "nlohmann-json-dev" "opengl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp ament-lint-auto ament-lint-common backward-ros builtin-interfaces camera-info-manager cv-bridge diagnostic-msgs diagnostic-updater image-publisher image-transport orbbec-camera-msgs rclcpp rclcpp-components sensor-msgs statistics-msgs std-msgs std-srvs tf2 tf2-eigen tf2-msgs tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libdw-dev" "libgflags-dev" "libgoogle-glog-dev" "nlohmann-json-dev" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "orbbec_camera" = substituteSource {
      src = fetchgit {
        name = "orbbec_camera-source";
        url = "https://github.com/orbbec/orbbec_camera_v1-release.git";
        rev = "04581ddc375ed56ea19c13a54cbf02ad6aa5a311";
        hash = "sha256-/nJ2SwggywT6v9dooRBAIzcb/+D/9Y7SDHWMPTxsAJY=";
      };
    };
  });
  meta = {
    description = "Orbbec Camera package";
  };
})
