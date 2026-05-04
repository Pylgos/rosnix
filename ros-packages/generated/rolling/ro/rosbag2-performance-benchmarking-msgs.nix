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
  version = "0.33.1-2";
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
        rev = "acc1692279dc10e1f9d9854761a094953f19f4f4";
        hash = "sha256-rfaiCOEhvkvhI9q2izoTbgKi0AokE04MQm/CR6aBzbQ=";
      };
    };
  });
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
})
