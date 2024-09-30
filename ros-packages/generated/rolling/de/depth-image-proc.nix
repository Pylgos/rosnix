{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-proc,
  image-transport,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "depth_image_proc" = substituteSource {
      src = fetchgit {
        name = "depth_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "f8767d98e14ecadb0040f7ee603721db2b1c8e6a";
        hash = "sha256-iXzePoqM7vsVgt2Y9h3m2scZ7J8qfIkJ31crq9I/j9s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "depth-image-proc";
  version = "6.0.3-1";
  src = sources."depth_image_proc";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class-loader cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs tf2 tf2-eigen tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains components for processing depth images such as those produced by OpenNI camera. Functions include creating disparity images and point clouds, as well as registering (reprojecting) a depth image into another camera frame.";
  };
}