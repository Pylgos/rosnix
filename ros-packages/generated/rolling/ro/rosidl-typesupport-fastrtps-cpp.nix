{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
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
  version = "3.7.1-3";
  src = finalAttrs.passthru.sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fastrtps_cmake_module" "python3" ]; };
  propagatedBuildInputs = [ ament-index-python fastcdr rmw rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture rcutils ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "1c2ef43263547196b06a762917662912b764022c";
        hash = "sha256-vfdi8kw5T/h7OEw1WKBTYW5sT/dpa2FPASjGUJCRYGs=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
