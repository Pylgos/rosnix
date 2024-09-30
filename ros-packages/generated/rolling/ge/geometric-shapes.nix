{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-cmake,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "geometric_shapes" = substituteSource {
      src = fetchgit {
        name = "geometric_shapes-source";
        url = "https://github.com/ros2-gbp/geometric_shapes-release.git";
        rev = "64d51b830c30086c0e79af229e2394fbb13fbb8b";
        hash = "sha256-o2Eck5v0SgZlsbOmbpf5qikEjkjDqv/wJ2kTdTiq2RQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "geometric_shapes";
  version = "2.2.1-1";
  src = sources."geometric_shapes";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console-bridge-vendor eigen-stl-containers geometry-msgs random-numbers rclcpp resource-retriever rosidl-default-runtime shape-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "assimp-dev" "eigen" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" "liboctomap-dev" "libqhull" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package contains generic definitions of geometric shapes and bodies.";
  };
}
