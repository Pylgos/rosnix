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
  version = "0.46.0-1";
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
        rev = "46c280494fc15e7a5e4a6fbc923d06d49914f3b4";
        hash = "sha256-EsQ+Kphpi0qJmnK+/TfwEETBO6qw6XAsnXAQUDBStj0=";
      };
    };
  });
  meta = {
    description = "\n    KDL binding for tf2\n  ";
  };
})
