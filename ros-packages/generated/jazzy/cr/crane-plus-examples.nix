{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  crane-plus-control,
  crane-plus-description,
  crane-plus-moveit-config,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-geometry,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  usb-cam,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_examples";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ crane-plus-control crane-plus-description crane-plus-moveit-config cv-bridge geometry-msgs image-geometry moveit-ros-planning-interface rclcpp tf2-geometry-msgs usb-cam ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_examples" = substituteSource {
      src = fetchgit {
        name = "crane_plus_examples-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "9f7f59be2a9f18ec34f2269ea893f375cc29e2fb";
        hash = "sha256-vbjPjA2OdvVdPa8clZCzCHSLjKKYxJ47efReiWIx88Q=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 examples package";
  };
})
