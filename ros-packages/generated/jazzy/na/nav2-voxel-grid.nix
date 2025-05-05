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
  nav2-common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_voxel_grid";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_voxel_grid";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav2-common rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_voxel_grid" = substituteSource {
      src = fetchgit {
        name = "nav2_voxel_grid-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6803861581b62ba70243f646ed1e219ac787aa5f";
        hash = "sha256-XpF7oK0FlZNgK8xEdng43Qe1fuSEBPvWWmpE1/uVIV0=";
      };
    };
  });
  meta = {
    description = "\n      voxel_grid provides an implementation of an efficient 3D voxel grid. The occupancy grid can support 3 different representations for the state of a cell: marked, free, or unknown. Due to the underlying implementation relying on bitwise and and or integer operations, the voxel grid only supports 16 different levels per voxel column. However, this limitation yields raytracing and cell marking performance in the grid comparable to standard 2D structures making it quite fast compared to most 3D structures.\n  ";
  };
})
