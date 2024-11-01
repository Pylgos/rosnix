{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  image-proc,
  image-transport,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "stereo_image_proc" = substituteSource {
      src = fetchgit {
        name = "stereo_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "8b0dd016615bead703ae791b3dc68dcd4f12201a";
        hash = "sha256-K5z37gXvskkl5vLC2PnKN9oFaPCNuocldeQNYglvlDU=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "stereo_image_proc";
  version = "5.0.5-1";
  src = finalAttrs.passthru.sources."stereo_image_proc";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge image-geometry image-proc image-transport message-filters rclcpp rclcpp-components sensor-msgs stereo-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing launch-testing-ament-cmake python-cmake-module rclpy ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Stereo and single image rectification and disparity processing.";
  };
})
