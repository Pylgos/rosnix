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
  version = "6.4.4-1";
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
        rev = "4c24876efe307679ecb6f1bf17ca01818e7b3a2c";
        hash = "sha256-Vif0e0N7d3NHZ0qeCBmXMZfFHAXMxn0/aMAvUPiTVsw=";
      };
    };
  });
  meta = {
    description = "Python API for image_transport";
  };
})
