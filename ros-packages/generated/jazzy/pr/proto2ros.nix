{
  ament-cmake,
  ament-cmake-mypy,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rosidl-adapter,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "proto2ros";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."proto2ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-mypy builtin-interfaces rclcpp rclpy rosidl-adapter rosidl-default-generators rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "protobuf" "protobuf-dev" "python3-inflection" "python3-jinja2" "python3-multipledispatch" "python3-networkx" "python3-numpy" "python3-protobuf" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-mypy builtin-interfaces rclcpp rclpy rosidl-adapter rosidl-default-generators rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "protobuf" "protobuf-dev" "python3-inflection" "python3-jinja2" "python3-multipledispatch" "python3-networkx" "python3-numpy" "python3-protobuf" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "proto2ros" = substituteSource {
      src = fetchgit {
        name = "proto2ros-source";
        url = "https://github.com/bdaiinstitute/proto2ros-release.git";
        rev = "29096bc6ec5582205db4f02cea33fecfc51f169d";
        hash = "sha256-nWcg2sq9rl6GejEqic9YE1G0NXe6zTLnyxhfIsl46UM=";
      };
    };
  });
  meta = {
    description = "Protobuf to ROS 2 interoperability interfaces";
  };
})
