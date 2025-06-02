{
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw,
  rosSystemPackages,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_fastrtps_cpp";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-generator-cpp rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-generator-cpp rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "90821f5675614f53c13a521f428c4a89002024fb";
        hash = "sha256-oVawsbTRL2BLc9PibzdavpFCq2F6/lV2GcyIbscztwM=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
