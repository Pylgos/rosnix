{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."service_load_balancing";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rosidl-default-runtime rosidl-typesupport-introspection-cpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rosidl-default-runtime rosidl-typesupport-introspection-cpp std-msgs ];
  checkInputs = [ ament-cmake-gtest example-interfaces rclcpp std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "service_load_balancing" = substituteSource {
      src = fetchgit {
        name = "service_load_balancing-source";
        url = "https://github.com/ros2-gbp/service_load_balancing-release.git";
        rev = "4a69dff2b365238a443159d41d3dcb692947de2d";
        hash = "sha256-ObzQQIefxvDoH85VQ2WScp+dk2MVC6gUhugMOhB42v0=";
      };
    };
  });
  meta = {
    description = "This package helps ROS2 services implement load balancing functionality.";
  };
})
