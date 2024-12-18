{
  ament-cmake,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-runtime,
  rosidl-typesupport-introspection-cpp,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "service_load_balancing";
  version = "0.1.1-2";
  src = finalAttrs.passthru.sources."service_load_balancing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rosidl-default-runtime rosidl-typesupport-introspection-cpp std-msgs ];
  checkInputs = [ example-interfaces rclcpp std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "service_load_balancing" = substituteSource {
      src = fetchgit {
        name = "service_load_balancing-source";
        url = "https://github.com/ros2-gbp/service_load_balancing-release.git";
        rev = "273f0c0c033ab27081fc9d49c54425fb35647225";
        hash = "sha256-fvtOdE6iD0DLvCT+PyIQCAf0yUxDOPZCQ2eXSqtIcjY=";
      };
    };
  });
  meta = {
    description = "This package helps ROS2 services implement load balancing functionality.";
  };
})
