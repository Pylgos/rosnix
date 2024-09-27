{
  ament_cmake,
  buildRosPackage,
  compressed_depth_image_transport,
  compressed_image_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  theora_image_transport,
  zstd_image_transport,
}:
let
  sources = rec {
    image_transport_plugins-ac603a6b29fa2de171f18520b91d9e6d56d42f39 = substituteSource {
      src = fetchgit {
        name = "image_transport_plugins-ac603a6b29fa2de171f18520b91d9e6d56d42f39-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "ac603a6b29fa2de171f18520b91d9e6d56d42f39";
        hash = "sha256-lecP7x02TUp6773w046EZfJrxj4m5dtuTwm7v1Uu+l0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport_plugins";
  version = "4.0.2-1";
  src = sources.image_transport_plugins-ac603a6b29fa2de171f18520b91d9e6d56d42f39;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ compressed_depth_image_transport compressed_image_transport theora_image_transport zstd_image_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of plugins for publishing and subscribing to sensor_msgs/Image topics in representations other than raw pixel data. For example, for viewing a stream of images off-robot, a video codec will give much lower bandwidth and latency. For low frame rate tranport of high-definition images, you might prefer sending them as JPEG or PNG-compressed form.";
  };
}
