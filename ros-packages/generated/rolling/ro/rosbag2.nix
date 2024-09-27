{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2bag,
  rosSystemPackages,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_py,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_tests,
  rosbag2_transport,
  shared_queues_vendor,
  substituteSource,
}:
let
  sources = rec {
    rosbag2-e32c0c2213442b1caee737133e7df0ba23e59b27 = substituteSource {
      src = fetchgit {
        name = "rosbag2-e32c0c2213442b1caee737133e7df0ba23e59b27-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e32c0c2213442b1caee737133e7df0ba23e59b27";
        hash = "sha256-c3UYJu0AeoqCNUqe5cV7u6odIVFlRrTtgQSTe+V/oZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2";
  version = "0.29.0-1";
  src = sources.rosbag2-e32c0c2213442b1caee737133e7df0ba23e59b27;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros2bag rosbag2_compression rosbag2_compression_zstd rosbag2_cpp rosbag2_py rosbag2_storage rosbag2_storage_default_plugins rosbag2_transport shared_queues_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ rosbag2_test_common rosbag2_tests ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
}
