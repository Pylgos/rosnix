{
  ament-cmake,
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
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-generator-cpp rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-generator-cpp rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "fb6cba836e2ccdcca4a9ddf837b55b3161452600";
        hash = "sha256-+Uryx1kRe7GcWO0Lk/qv8m2R7vnt8d+1yqK0fempQ2k=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
