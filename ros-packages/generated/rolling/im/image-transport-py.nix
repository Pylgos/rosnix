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
  pybind11-vendor,
  rclcpp,
  rosSystemPackages,
  rpyutils,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_transport_py";
  version = "6.2.0-1";
  src = finalAttrs.passthru.sources."image_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ image-transport pybind11-vendor rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ image-transport pybind11-vendor rclcpp rpyutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport_py" = substituteSource {
      src = fetchgit {
        name = "image_transport_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "e346616dd83a0c6c9c5be66b29a30d6a891603bd";
        hash = "sha256-wQXYcgcVdyAYJUGNIGm87RHqoyYdQ9vFN52CV270tf4=";
      };
    };
  });
  meta = {
    description = "Python API for image_transport";
  };
})
