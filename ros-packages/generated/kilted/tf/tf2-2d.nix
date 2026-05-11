{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_2d";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."tf2_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libboost-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_2d" = substituteSource {
      src = fetchgit {
        name = "tf2_2d-source";
        url = "https://github.com/ros2-gbp/tf2_2d-release.git";
        rev = "52af8f2f09fd61aead4416c76fac840c7e137284";
        hash = "sha256-KGSO0kwOLC8n3duUIsg5kj8Y0N69/1/C/gQVjyXt3lk=";
      };
    };
  });
  meta = {
    description = "\n    A set of 2D geometry classes modeled after the 3D geometry classes in tf2.\n  ";
  };
})
