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
  version = "4.1.2-1";
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
        rev = "a8a28151af03e862c27fc7a53217db212291d22f";
        hash = "sha256-37J//cZzeKkQA9rbYI8kH0nPIEVTJuAwGypiblVUFSs=";
      };
    };
  });
  meta = {
    description = "\n    C++ implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
