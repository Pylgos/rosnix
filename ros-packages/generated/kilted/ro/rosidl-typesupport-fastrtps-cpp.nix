{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros-core,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  performance-test-fixture,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_fastrtps_cpp";
  version = "3.8.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros-core ament-index-python fastcdr rmw rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-ros-core ament-index-python fastcdr rmw rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture rcutils ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "8ed10f8e170be14d098cacfab58a713e20330ba7";
        hash = "sha256-NEHoA/1m8YvTEK2gxFDVkrcR3S6M3mxp1Gb5BAB12fM=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
