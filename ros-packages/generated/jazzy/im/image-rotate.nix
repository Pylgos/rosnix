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
  version = "5.0.11-1";
  src = finalAttrs.passthru.sources."image_rotate";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ class-loader cv-bridge geometry-msgs image-transport rcl-interfaces rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader cv-bridge geometry-msgs image-transport rcl-interfaces rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_rotate" = substituteSource {
      src = fetchgit {
        name = "image_rotate-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "e82713a00bd48054d495150d69fa59765425f34e";
        hash = "sha256-zV545skmgpwP63BNtet8wf6Ha1a1erol7sk3RFUwCeI=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
