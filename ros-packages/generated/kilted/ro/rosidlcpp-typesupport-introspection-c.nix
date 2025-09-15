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
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_introspection_c";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_introspection_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-index-python ros-environment rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_introspection_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "44f0acc465cb8f37ffe39a49c2ce300c05abad4b";
        hash = "sha256-vu1rCNCGDavuVxWH3TIrPWIk8s8J3iS9v0jEps78lBA=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C.\n  ";
  };
})
