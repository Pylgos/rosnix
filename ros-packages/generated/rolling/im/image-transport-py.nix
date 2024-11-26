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
  version = "6.0.3-1";
  src = finalAttrs.passthru.sources."image_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ image-transport pybind11-vendor rclcpp rpyutils sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "image_transport_py" = substituteSource {
        src = fetchgit {
          name = "image_transport_py-source";
          url = "https://github.com/ros2-gbp/image_common-release.git";
          rev = "04d06cb264cd0e678046c0c36c08f6313af868ff";
          hash = "sha256-ZOVDp7Wplp/kmteZcZJD0gchpGcQJn2tro69cxaV0dk=";
        };
      };
    });
  };
  meta = {
    description = "Python API for image_transport";
  };
})
