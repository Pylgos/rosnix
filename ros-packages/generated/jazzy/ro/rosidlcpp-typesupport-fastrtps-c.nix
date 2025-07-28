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
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-fastrtps-cpp,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_fastrtps_c";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_fastrtps_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-ros fastcdr rmw rosidl-generator-c rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-cpp rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_fastrtps_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_fastrtps_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "5930c94b849e8e34e106f46dd33a50b1e69f42e9";
        hash = "sha256-/IHJ9Lqp7FFErTtG9qK/5neARuiokq9ev4rk6/GaV2w=";
      };
    };
  });
  meta = {
    description = "Generate the C interfaces for eProsima FastRTPS.";
  };
})
