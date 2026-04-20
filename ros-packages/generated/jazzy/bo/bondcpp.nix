{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  bond,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bondcpp";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."bondcpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bond rclcpp rclcpp-lifecycle smclib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "uuid" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond rclcpp rclcpp-lifecycle smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "uuid" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bondcpp" = substituteSource {
      src = fetchgit {
        name = "bondcpp-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "6040c228bb6dff75a6fd1ab8b6d70ed36548bbe9";
        hash = "sha256-BQUWqZwCe2a2shLB8eT6vD9tswoP7KXzEkix19MVN3o=";
      };
    };
  });
  meta = {
    description = "\n    C++ implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
