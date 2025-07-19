{
  ament-cmake,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gurumdds-cmake-module,
  mkSourceSet,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-dds-idl,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_gurumdds_cpp";
  version = "6.0.1-1";
  src = finalAttrs.passthru.sources."rmw_gurumdds_cpp";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core rosidl-cmake ];
  propagatedNativeBuildInputs = [ gurumdds-cmake-module rcutils rmw rmw-dds-common rosidl-generator-dds-idl rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gurumdds-3.2" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core rosidl-cmake ];
  propagatedBuildInputs = [ gurumdds-cmake-module rcutils rmw rmw-dds-common rosidl-generator-dds-idl rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_gurumdds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_gurumdds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "e289bf0c472d34b1142864bc6d546203bece762a";
        hash = "sha256-GmH9SRS838PjvH/o+qb1uzm+ZyEc/bt0a0z9/lz4nx0=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using GurumNetworks GurumDDS static code generation in C++.";
  };
})
