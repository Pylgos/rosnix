{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hri,
  hri-msgs,
  mkSourceSet,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pyhri";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."pyhri";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs hri pybind11-vendor rclcpp rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs hri pybind11-vendor rclcpp rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common cv-bridge geometry-msgs hri-msgs sensor-msgs std-msgs tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pyhri" = substituteSource {
      src = fetchgit {
        name = "pyhri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "73277b84b355ac7ba84b9937be065b471f4c7f29";
        hash = "sha256-9DUz4gSTSL0T2akrC9KgeAh4qr2iBaUOj0jvF79yGag=";
      };
    };
  });
  meta = {
    description = "A python wrapper around hri package";
  };
})
