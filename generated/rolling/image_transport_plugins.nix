{
  ament_cmake,
  buildRosPackage,
  compressed_depth_image_transport,
  compressed_image_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  theora_image_transport,
  zstd_image_transport,
}:
let
  sources = rec {
    image_transport_plugins = substituteSource {
      src = fetchgit {
        name = "image_transport_plugins-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "bd4c8419b2e58ee263c58f2900fdbecb0feada27";
        hash = "sha256-Kff7avXfi8zrLe4JBJ/j1eLrZ1kpPPZWLUtGTO5VtQM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport_plugins";
  version = "5.0.0-1";
  src = sources.image_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ compressed_depth_image_transport compressed_image_transport theora_image_transport zstd_image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A set of plugins for publishing and subscribing to sensor_msgs/Image topics in representations other than raw pixel data. For example, for viewing a stream of images off-robot, a video codec will give much lower bandwidth and latency. For low frame rate tranport of high-definition images, you might prefer sending them as JPEG or PNG-compressed form.";
  };
}
