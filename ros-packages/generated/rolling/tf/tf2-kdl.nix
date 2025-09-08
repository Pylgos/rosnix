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
  version = "0.45.0-1";
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
        rev = "3225a5dd5e7378648b05631b24683fa8efbcc341";
        hash = "sha256-ERz7bMlgIADIOjjWQLx4DzfCVKUfq2U51oNCorDQptk=";
      };
    };
  });
  meta = {
    description = "\n    KDL binding for tf2\n  ";
  };
})
