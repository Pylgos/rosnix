{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_tf";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_tf";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-geometry geometry-msgs rclcpp tf2-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-geometry geometry-msgs rclcpp tf2-ros ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_tf" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_tf-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "17a9c0ee595c88dad564a27f9b5054f361eabd51";
        hash = "sha256-b8fowpQy/6P6axnt0bJUwT1HlJ2LqJm+A2knn90zLPw=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_tf package";
  };
})
