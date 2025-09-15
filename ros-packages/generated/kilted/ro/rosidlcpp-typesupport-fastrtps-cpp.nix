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
  version = "0.4.0-1";
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
        rev = "94211b78519f01dc231d681acf8fc8c6c6f8a55d";
        hash = "sha256-uhh+CsLLu3RV+OUHVu1rL/0zArmqMMO/8DvbRML6qJA=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
