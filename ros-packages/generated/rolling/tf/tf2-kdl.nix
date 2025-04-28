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
  version = "0.42.0-1";
  src = finalAttrs.passthru.sources."tf2_kdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs orocos-kdl-vendor python-orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ];
  checkInputs = [ ament-cmake-gtest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_kdl" = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "f2aee6b6a4ba3a097b8ce63e0ce011181f30ae32";
        hash = "sha256-l+aXPH89uingZAofj+J4eRZ6RfAeW8X5pt5tJIahgHw=";
      };
    };
  });
  meta = {
    description = "KDL binding for tf2";
  };
})
