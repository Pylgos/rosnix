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
  fastrtps-cmake-module,
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
  version = "3.7.1-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fastrtps-cmake-module rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python fastcdr rmw rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture rcutils ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_fastrtps_cpp" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_fastrtps_cpp-source";
          url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
          rev = "316702b1ade1c07b5ab60b508273429cff1dc9fd";
          hash = "sha256-vfdi8kw5T/h7OEw1WKBTYW5sT/dpa2FPASjGUJCRYGs=";
        };
      };
    });
  };
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
