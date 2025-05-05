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
  version = "1.4.0-1";
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
        rev = "89120ca2ad6a33754ea1e08f3f8da99e4f9b0d01";
        hash = "sha256-zO2tfSDXFCg0SKNQjezq4H2VIzAzXotJDkTLQq3vziY=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_tf package";
  };
})
