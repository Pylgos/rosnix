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
  version = "0.0.4-3";
  src = finalAttrs.passthru.sources."picknik_twist_controller";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  passthru.sources = mkSourceSet (sources: {
    "picknik_twist_controller" = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "185ce52c2618300abb068d15d844e7ffb9189c48";
        hash = "sha256-Yioqzd0lkprPakmZv+Dv2fxMVLU6dcp0qkxlF4DwfG0=";
      };
    };
  });
  meta = {
    description = "Subscribes to twist msg and forwards to hardware";
  };
})
