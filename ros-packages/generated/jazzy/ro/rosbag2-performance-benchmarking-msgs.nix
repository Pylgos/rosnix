{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-typesupport-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_performance_benchmarking_msgs";
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-typesupport-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "f3481579b720b48679a2e7ce01919ea2462b18be";
        hash = "sha256-yuosGJr8OYYmNQNQdy+ABRXKag4HQZalJsLzpuFwotA=";
      };
    };
  });
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
})
