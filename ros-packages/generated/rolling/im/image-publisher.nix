{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  camera-info-manager,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "image_publisher" = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c5ab135c721c8e346e2dcd86779e4644740f4800";
        hash = "sha256-tD37S9/S1T4y3f7AKODt5zsCgYCCERxOZ6Q4AfqNNO0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "image_publisher";
  version = "6.0.3-1";
  src = sources."image_publisher";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-info-manager cv-bridge image-transport rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains a node publish an image stream from single image file or avi motion file.";
  };
}
