{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fastcdr,
  fastrtps,
  fastrtps-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rmw-fastrtps-shared-cpp,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  rosidl-dynamic-typesupport-fastrtps,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-fastrtps-cpp,
  substituteSource,
  test-msgs,
  tracetools,
}:
let
  sources = mkSourceSet (sources: {
    "rmw_fastrtps_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "f78c19f0cd61996a51d6f6d37dfadbc83fc689b4";
        hash = "sha256-FVVmruH4Z0jc0NamA+E7VtTHwiermrVGERxOCLpGKGs=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_fastrtps_cpp";
  version = "9.0.2-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_cpp";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake fastrtps-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw rmw-dds-common rmw-fastrtps-shared-cpp rosidl-dynamic-typesupport rosidl-dynamic-typesupport-fastrtps rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Implement the ROS middleware interface using eProsima FastRTPS static code generation in C++.";
  };
})
