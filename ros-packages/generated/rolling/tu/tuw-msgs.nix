{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tuw-airskin-msgs,
  tuw-geometry-msgs,
  tuw-graph-msgs,
  tuw-multi-robot-msgs,
  tuw-nav-msgs,
  tuw-object-map-msgs,
  tuw-object-msgs,
  tuw-std-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_msgs";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."tuw_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components tuw-airskin-msgs tuw-geometry-msgs tuw-graph-msgs tuw-multi-robot-msgs tuw-nav-msgs tuw-object-map-msgs tuw-object-msgs tuw-std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "cc31770819522f3686ff9d01f6981e60fa028823";
        hash = "sha256-/ivRxn+Szj+o/Xr1Al/YopJXooQY5b/6oUcuEa9cYOE=";
      };
    };
  });
  meta = {
    description = "tuw_msgs meta package with write and read file libs for tuw_msgs";
  };
})
