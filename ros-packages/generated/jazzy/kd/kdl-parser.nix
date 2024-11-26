{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  rcutils,
  rosSystemPackages,
  substituteSource,
  urdf,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_parser";
  version = "2.11.0-3";
  src = finalAttrs.passthru.sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "62e426bc35f02277867bdb8204444c055c6d0d85";
        hash = "sha256-0pqo6+kDyd4jq/rIh9aXBLrvipyDVHZKbj2VAlBvZ/g=";
      };
    };
  });
  meta = {
    description = "The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism.";
  };
})
