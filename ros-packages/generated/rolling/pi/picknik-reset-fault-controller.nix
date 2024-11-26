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
  pname = "picknik_reset_fault_controller";
  version = "0.0.3-2";
  src = finalAttrs.passthru.sources."picknik_reset_fault_controller";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ];
  passthru.sources = mkSourceSet (sources: {
    "picknik_reset_fault_controller" = substituteSource {
      src = fetchgit {
        name = "picknik_reset_fault_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "6d183a64ea14c307bcb39906198b8a926664cf60";
        hash = "sha256-1YeT/ItbimfyeiruRaU6K0IcXsIuJworLhzpN4VczDs=";
      };
    };
  });
  meta = {
    description = "ROS 2 controller that offers a service to clear faults in a hardware interface";
  };
})
