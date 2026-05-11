{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmw-fastrtps-cpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "demo_nodes_cpp_native";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."demo_nodes_cpp_native";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp rclcpp-components rmw-fastrtps-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp rclcpp-components rmw-fastrtps-cpp ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_cpp_native" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_cpp_native-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "0cf53c47bc75667259dd4186b42407072144fea6";
        hash = "sha256-KYfn/qVn1SQDOR3Rod7qKQ/TaZiuTvq3skr1vKSWgqQ=";
      };
    };
  });
  meta = {
    description = "\n    C++ nodes which access the native handles of the rmw implementation.\n  ";
  };
})
