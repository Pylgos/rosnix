{
  ament-cmake-ros,
  buildAmentCmakePackage,
  controller-interface,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  realtime-tools,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "picknik_twist_controller";
  version = "0.0.4-2";
  src = finalAttrs.passthru.sources."picknik_twist_controller";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  passthru.sources = mkSourceSet (sources: {
    "picknik_twist_controller" = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "f5715dd5fe4c58851066f2e0d05c6bad2393440f";
        hash = "sha256-Yioqzd0lkprPakmZv+Dv2fxMVLU6dcp0qkxlF4DwfG0=";
      };
    };
  });
  meta = {
    description = "Subscribes to twist msg and forwards to hardware";
  };
})
