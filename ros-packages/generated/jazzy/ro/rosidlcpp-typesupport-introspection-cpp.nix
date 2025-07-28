{
  ament-cmake,
  ament-cmake-ros,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_introspection_cpp";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_introspection_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_introspection_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "6af9ab420c06a0905ecea5aa699d7df8f43747d3";
        hash = "sha256-OgwRmpGCA1DD4m2BqEaVeJR46IPDc5Bwkj5LJ0ZCG4g=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C++.\n  ";
  };
})
