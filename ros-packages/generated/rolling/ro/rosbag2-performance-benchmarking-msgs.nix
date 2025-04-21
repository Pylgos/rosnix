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
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake rosidl-typesupport-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c9512e6645c5b5c2bdada47d654049e1e0c6151b";
        hash = "sha256-3D7uBWAjcEnDGuTpUkYPqXromNOxPLTaky8f2pJU3Bs=";
      };
    };
  });
  meta = {
    description = "A package containing rosbag2 performance benchmarking specific messages.";
  };
})
