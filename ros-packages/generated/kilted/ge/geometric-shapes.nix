{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  console-bridge-vendor,
  eigen-stl-containers,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  random-numbers,
  rclcpp,
  resource-retriever,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geometric_shapes";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."geometric_shapes";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ console-bridge-vendor eigen3-cmake-module eigen-stl-containers geometry-msgs random-numbers rclcpp resource-retriever rosidl-default-runtime shape-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "assimp-dev" "eigen" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" "libfcl" "libfcl-dev" "liboctomap-dev" "libqhull" "pkg-config" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ console-bridge-vendor eigen3-cmake-module eigen-stl-containers geometry-msgs random-numbers rclcpp resource-retriever rosidl-default-runtime shape-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "assimp-dev" "eigen" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" "libfcl" "libfcl-dev" "liboctomap-dev" "libqhull" "pkg-config" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometric_shapes" = substituteSource {
      src = fetchgit {
        name = "geometric_shapes-source";
        url = "https://github.com/ros2-gbp/geometric_shapes-release.git";
        rev = "4751793995e05cd2236cf307c971525e99e06f94";
        hash = "sha256-ml9MXolpAINGyqzOjxRQkH47pAD8r8RM5RdRVhyN13Y=";
      };
    };
  });
  meta = {
    description = "This package contains generic definitions of geometric shapes and bodies.";
  };
})
