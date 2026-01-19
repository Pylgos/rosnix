{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_kdl";
  version = "0.45.6-1";
  src = finalAttrs.passthru.sources."tf2_kdl";
  nativeBuildInputs = [ ament-cmake ament-cmake-python eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" "python3-pykdl" ]; };
  buildInputs = [ ament-cmake ament-cmake-python eigen3-cmake-module ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" "python3-pykdl" ]; };
  checkInputs = [ ament-cmake-gtest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "a9772e751802536b4ba3e481753b9a9ae70ca3dc";
        hash = "sha256-2rw++bHypNukOhEH/xmUW155ugj1S9Y391ifQ4jBtHw=";
      };
    };
  });
  meta = {
    description = "\n    KDL binding for tf2\n  ";
  };
})
