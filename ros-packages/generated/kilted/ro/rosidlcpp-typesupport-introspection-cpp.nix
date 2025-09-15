{
  ament-cmake,
  ament-cmake-ros-core,
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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_introspection_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_introspection_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "7a7fbe7af52b5b8e0f5b87e0caf5a8aae747347f";
        hash = "sha256-m6p2PfJDAc3EA6LTk6koB4nULDJ+LFMVAwfVZ0FNWng=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C++.\n  ";
  };
})
