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
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."image_transport_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ image-transport pybind11-vendor rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_transport_py" = substituteSource {
      src = fetchgit {
        name = "image_transport_py-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "bebb947556fdbada87f686bc541a68dfd55623cd";
        hash = "sha256-srnHNwVP4ZaGJseDs/Ogw4ashrbQ01sQSNkSPONy++k=";
      };
    };
  });
  meta = {
    description = "Python API for image_transport";
  };
})
