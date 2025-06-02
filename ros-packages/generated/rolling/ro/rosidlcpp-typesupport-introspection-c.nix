{
  ament-cmake-ros,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_introspection_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_introspection_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "79bc5a4590640b2252fdb9f146182fd075760b0f";
        hash = "sha256-hw7gEp+iMZC5lzd1yycQ7HL7ajymuylRABuylXxPDcY=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C.\n  ";
  };
})
