{
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cyclonedds,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx-binding-c,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rmw-security-common,
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_cyclonedds_cpp";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."rmw_cyclonedds_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ cyclonedds iceoryx-binding-c rcutils rmw rmw-dds-common rmw-security-common rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_cyclonedds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_cyclonedds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_cyclonedds-release.git";
        rev = "751f41ec9904a7e2c595ac8c8c520ff7654c32ca";
        hash = "sha256-dJp/czJidhWlZeZANza+fQuCeh2U7ZcC8gBiT2PDnmU=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using Eclipse CycloneDDS in C++.";
  };
})
