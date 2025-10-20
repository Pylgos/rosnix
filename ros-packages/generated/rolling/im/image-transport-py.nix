{
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_transport_py";
  version = "6.4.2-1";
  src = finalAttrs.passthru.sources."image_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ image-transport rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ image-transport rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport_py" = substituteSource {
      src = fetchgit {
        name = "image_transport_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "eccdd754d1804145eb8824907490edae83be17da";
        hash = "sha256-nRlFOeWl06gO6dxFwFDa9WrkHtz9ZFP4vkpORVsNrNo=";
      };
    };
  });
  meta = {
    description = "Python API for image_transport";
  };
})
