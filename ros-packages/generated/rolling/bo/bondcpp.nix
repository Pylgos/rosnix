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
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ bond smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "uuid" ]; };
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
    description = "C++ implementation of bond, a mechanism for checking when another process has terminated.";
  };
})
