{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_rotate";
  version = "6.0.5-1";
  src = finalAttrs.passthru.sources."image_rotate";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader cv-bridge geometry-msgs image-transport rcl-interfaces rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_rotate" = substituteSource {
      src = fetchgit {
        name = "image_rotate-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "cacfa692997868eecae48fa05e1567e82a6d197f";
        hash = "sha256-lOwu3l7Dq3w3wchLsg8ubBrAfSaKJGEtZYAsj90wtUs=";
      };
    };
  });
  meta = {
    description = "";
  };
})
