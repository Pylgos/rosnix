{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2bag,
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
    rosbag2 = substituteSource {
      src = fetchgit {
        name = "rosbag2-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6ba01fa099671d7ca84cafa41ae663732bb3511f";
        hash = "sha256-dKeT6PQJAjB2IrW3pDrKpGTBey0i+0+I4cGEyHdn1Ts=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2";
  version = "0.26.4-1";
  src = sources.rosbag2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2bag rosbag2_compression rosbag2_compression_zstd rosbag2_cpp rosbag2_py rosbag2_storage rosbag2_storage_default_plugins rosbag2_transport shared_queues_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ rosbag2_test_common rosbag2_tests ];
  missingDependencies = [  ];
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
}
