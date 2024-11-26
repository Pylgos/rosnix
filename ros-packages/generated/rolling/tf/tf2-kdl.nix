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
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-msgs,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_kdl";
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ];
  checkInputs = [ ament-cmake-gtest rclcpp tf2-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "cd9e89a15c2ff46da469c1112977e46a7f7231b7";
        hash = "sha256-athTpF/phJr2d2iya8GhN8+LvD7M11JGXbSuaCO358w=";
      };
    };
  });
  meta = {
    description = "KDL binding for tf2";
  };
})
