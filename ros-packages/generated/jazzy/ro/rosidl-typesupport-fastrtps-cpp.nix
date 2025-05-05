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
  version = "3.6.1-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-ros ament-index-python fastcdr fastrtps-cmake-module rmw rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-ros ament-index-python fastcdr fastrtps-cmake-module rmw rosidl-cli rosidl-generator-c rosidl-generator-cpp rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture rcutils ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "f984b7c339a8ffa214d095df19990eaef3c8e28e";
        hash = "sha256-U7FEmVG+7icdv+M495+H6N7mNqRL9+aeeMZ4mQBUxbg=";
      };
    };
  });
  meta = {
    description = "Generate the C++ interfaces for eProsima FastRTPS.";
  };
})
