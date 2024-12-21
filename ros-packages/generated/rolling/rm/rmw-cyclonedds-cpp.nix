{
  ament-cmake-ros,
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
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_cyclonedds_cpp";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."rmw_cyclonedds_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cyclonedds iceoryx-binding-c rcpputils rcutils rmw rmw-dds-common rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_cyclonedds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_cyclonedds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_cyclonedds-release.git";
        rev = "a7bc967bbf472b779317497b11017c1b79534758";
        hash = "sha256-jY0uim0aQPWibAmLsSE1iThIuzDcRk+8HdwBgck3fPE=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using Eclipse CycloneDDS in C++.";
  };
})
