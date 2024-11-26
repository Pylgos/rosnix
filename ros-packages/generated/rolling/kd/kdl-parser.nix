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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "cdbf9b2a8a2f95a13051dfb795e795b836e5530a";
        hash = "sha256-k9FAvPXK/EUOGHyUHB+uVIFTU+swbET5SO9mHMP450Y=";
      };
    };
  });
  meta = {
    description = "The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism.";
  };
})
