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
  version = "1.3.11-1";
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
        rev = "d03bace446cdd93f0ddd30e15918d66cc493cb00";
        hash = "sha256-nq/2O9cfna8x3+T4rFDS6s4zxk1e/yM4XjX3aE/QPfY=";
      };
    };
  });
  meta = {
    description = "\n      voxel_grid provides an implementation of an efficient 3D voxel grid. The occupancy grid can support 3 different representations for the state of a cell: marked, free, or unknown. Due to the underlying implementation relying on bitwise and and or integer operations, the voxel grid only supports 16 different levels per voxel column. However, this limitation yields raytracing and cell marking performance in the grid comparable to standard 2D structures making it quite fast compared to most 3D structures.\n  ";
  };
})
