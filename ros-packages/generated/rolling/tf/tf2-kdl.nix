{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  orocos-kdl-vendor,
  python-orocos-kdl-vendor,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_kdl";
  version = "0.42.1-1";
  src = finalAttrs.passthru.sources."tf2_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs orocos-kdl-vendor python-orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs orocos-kdl-vendor python-orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ];
  checkInputs = [ ament-cmake-gtest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "3e8ae85416fa5c556da3589b45976a88e3e539b6";
        hash = "sha256-rS0LYLUb2kyBr6GogW5CEr6MyO23UUOwtNmuslqBPts=";
      };
    };
  });
  meta = {
    description = "\n    KDL binding for tf2\n  ";
  };
})
