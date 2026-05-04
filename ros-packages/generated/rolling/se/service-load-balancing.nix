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
  version = "0.1.3-2";
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
        rev = "f429ade0fc9f5532cae3cf69e2062f9fe116d9a2";
        hash = "sha256-Ct/Tvftb6p+UnfiinchAPXQpyFXWx7hdgRd1Caee1U4=";
      };
    };
  });
  meta = {
    description = "This package helps ROS2 services implement load balancing functionality.";
  };
})
