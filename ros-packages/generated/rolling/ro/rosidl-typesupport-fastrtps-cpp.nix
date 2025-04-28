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
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros-core rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python fastcdr rmw rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture rcutils ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "9f954676ae121419800d61346976af2505d26f24";
        hash = "sha256-r9RS6dzgRNmSgoguTJJzE8Gh6a6bj6Pz4XF8hVNcnng=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
